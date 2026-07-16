# Currículo Profissional com LaTeX

Este repositório contém o código-fonte de um currículo profissional desenvolvido em LaTeX. O objetivo é criar um documento bem estruturado, elegante e fácil de personalizar.

## Estrutura do Projeto

```plain
├── config/
│   └── preamble.tex                    # Configurações e pacotes utilizados
├── prompts/
│   └── resume-updater.instructions.md  # Instruções para atualizar o currículo
│   └── latex-checker.instructions.md   # Instruções para checagem de LaTeX
├── sections/
│   ├── certifications.tex              # Seção de certificações
│   ├── contacts.tex                    # Seção de contatos
│   ├── education.tex                   # Seção de educação
│   ├── experience.tex                  # Seção de experiência profissional
│   ├── profile.tex                     # Seção de perfil profissional
│   ├── projects.tex                    # Seção de projetos
│   └── skills.tex                      # Seção de habilidades
├── .gitignore                          # Arquivo para ignorar arquivos desnecessários no Git
├── Makefile                            # Arquivo de configuração do Make para facilitar a compilação
├── main.tex                            # Arquivo principal do documento
└── README.md                           # Este arquivo
```

## Como Usar

Existem duas formas de compilar este projeto: utilizando Docker (método recomendado para evitar instalações locais) ou instalando o LaTeX manualmente.

### 🐳 Compilação com Docker (Recomendado)

Este projeto utiliza Docker e um `Makefile` para automatizar a compilação, garantindo que todos os pacotes necessários estejam disponíveis independentemente do seu sistema operacional.

1. Certifique-se de ter o **Docker** instalado em sua máquina.
2. No diretório do projeto, execute o comando:
   ```bash
   make build
   ```
   *Este comando utiliza a imagem `texlive/texlive:latest` e o `latexmk` para gerar o PDF final.*

**Outros comandos úteis do `Makefile`:**
- `make pdflatex`: Compilação rápida para testes de sintaxe.
- `make clean`: Remove arquivos auxiliares, mantendo o PDF.
- `make deep-clean`: Remove todos os arquivos gerados, incluindo o PDF.

### 🛠️ Compilação Manual (Local)

Se preferir não usar Docker, você precisará de uma distribuição LaTeX (como [TeX Live](https://www.tug.org/texlive/) ou [MikTeX](https://miktex.org/)) instalada:

1. Clone ou baixe este repositório e navegue até o diretório do projeto.
2. Compile o arquivo `main.tex` usando:
   ```bash
   latexmk -pdf -synctex=1 -interaction=nonstopmode -file-line-error main.tex
   ```
   Ou execute duas passadas de `pdflatex`:
   ```bash
   pdflatex -interaction=nonstopmode -synctex=1 -file-line-error main.tex
   pdflatex -interaction=nonstopmode -synctex=1 -file-line-error main.tex
   ```

O arquivo PDF gerado estará disponível no mesmo diretório.

## Personalização

- **Configurações Gerais**: Edite o arquivo `config/preamble.tex` para ajustar pacotes, configurações e metadados do documento.
- **Seções**: As seções do currículo estão localizadas na pasta `sections/`. Edite os arquivos para adicionar ou modificar informações.
- **Ordem das Seções**: A ordem das seções pode ser alterada no arquivo `main.tex`.

## Funcionalidades

- Design limpo e profissional.
- Totalmente personalizável.
- Suporte para múltiplas seções, como habilidades, experiência, educação e certificações.
- Configuração de metadados para otimização de PDFs.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
