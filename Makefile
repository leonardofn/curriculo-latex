# ==============================================================================
# CONFIGURAÇÕES DE VARIÁVEIS
# ==============================================================================

# Nome do arquivo principal (sem a extensão .tex)
DOC = main

# Imagem Docker oficial do LaTeX (contém todas as ferramentas necessárias)
IMAGE = texlive/texlive:latest

# Nome do container Docker usado para compilar o documento
CONTAINER_NAME = texlive-builder

# Comando Docker para criar o container se ele não existir
# -v "$(CURDIR):/data"	: Mapeia a pasta atual do host para a pasta /data do container
# -w /data         			: Define /data como o diretório de trabalho inicial
# tail -f /dev/null			: Usado para manter o container em execução sem fazer nada
DOCKER_CMD_CREATE = docker create --name $(CONTAINER_NAME) -v "$(CURDIR):/data" -w /data $(IMAGE) tail -f /dev/null

# Comando Docker para iniciar o container se ele já existir
DOCKER_CMD_START = docker start $(CONTAINER_NAME)

# Comando Docker para executar comandos dentro do container em execução
DOCKER_CMD_EXEC = docker exec -w /data $(CONTAINER_NAME)

# Comando Docker para parar e remover o container
DOCKER_CMD_STOP = docker rm -f $(CONTAINER_NAME)

# Comando base do Docker executado nativamente no diretório atual
# --rm             			: Remove o container automaticamente após a execução
# -v "$(CURDIR):/data"	: Mapeia a pasta atual do host para a pasta /data do container
# -w /data         			: Define /data como o diretório de trabalho inicial
DOCKER_CMD = docker run --rm -v "$(CURDIR):/data" -w /data $(IMAGE)

# ==============================================================================
# ALVOS PHONY (Evitam conflitos com arquivos homônimos)
# ==============================================================================
.PHONY: all prepare-container stop-container build pdflatex clean deep-clean help

# ==============================================================================
# REGRAS DE COMPILAÇÃO
# ==============================================================================

## prepare-container: Cria e inicia o container Docker de compilação
prepare-container:
	@docker inspect $(CONTAINER_NAME) >/dev/null 2>&1 || $(DOCKER_CMD_CREATE) >/dev/null
	@$(DOCKER_CMD_START) >/dev/null

## stop-container: Para e remove o container Docker de compilação
stop-container:
	@$(DOCKER_CMD_STOP) >/dev/null 2>&1 || true

# Alvo padrão executado ao rodar apenas 'make'
all: build

## build: Compila o documento de forma inteligente (padrão)
# Executa o 'latexmk' que gerencia automaticamente múltiplas passadas
# -f 								 				: Força a recompilação mesmo que os arquivos estejam atualizados
# -pdf                 			: Gera saída diretamente em formato PDF
# -synctex=1           			: Permite sincronização entre o PDF e o código fonte
# -interaction=nonstopmode 	: Não para a execução em caso de erros simples
# -file-line-error     			: Mostra os erros no formato arquivo:linha para fácil debug
build: prepare-container clean
	@echo "=> Compilando '$(DOC).tex' com latexmk via Docker..."
	$(DOCKER_CMD_EXEC) latexmk -pdf -synctex=1 -interaction=nonstopmode -file-line-error $(DOC).tex
	@echo "=> Compilação concluída com sucesso!"

## pdflatex: Compila o documento com apenas uma passada rápida
# Útil para checar a sintaxe rapidamente, sem atualizar índices ou bibliografias
pdflatex: prepare-container clean
	@echo "=> Compilando rápida com pdflatex via Docker..."
	$(DOCKER_CMD_EXEC) pdflatex -synctex=1 -interaction=nonstopmode $(DOC).tex

# ==============================================================================
# REGRAS DE LIMPEZA
# ==============================================================================

## clean: Remove arquivos auxiliares gerados durante a compilação
# Mantém o arquivo PDF intacto
clean:
	@echo "=> Removendo arquivos auxiliares..."
	@$(DOCKER_CMD) latexmk -c $(DOC).tex 2>/dev/null || true
	@rm -f *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz

## deep-clean: Remove todos os arquivos auxiliares e o PDF final
deep-clean: clean
	@echo "=> Removendo '$(DOC).pdf'..."
	@rm -f $(DOC).pdf

# ==============================================================================
# AJUDA DO SISTEMA
# ==============================================================================

## help: Mostra os comandos disponíveis e suas funções
help:
	@echo "Comandos disponíveis no Makefile:"
	@sed -n 's/^## //p' $(MAKEFILE_LIST) | awk -F: '{printf "  make %-12s - %s\n", $$1, $$2}'
