# AI Agent Instructions - Currículo LaTeX

Você está em um ambiente que não renderiza bem tags XML. Nunca inclua tags <thought></thought> ou o seu processo de raciocínio interno na resposta final. Responda diretamente e apenas com o resultado final solicitado. **Sempre responda em português do Brasil.**

Este projeto é um currículo profissional desenvolvido em LaTeX, utilizando o motor `pdflatex` e gerenciado via Docker para garantir a reprodutibilidade do ambiente.

## 🛠️ Fluxo de Build e Compilação

A compilação é automatizada via `Makefile`. Sempre utilize esses comandos para evitar problemas de dependências locais:

- **Compilação Completa**: `make build` (Utiliza `latexmk` para garantir que todas as referências e índices sejam resolvidos).
- **Compilação Rápida**: `make pdflatex` (Ideal para testes rápidos de sintaxe).
- **Limpeza de Arquivos Auxiliares**: `make clean` (Remove arquivos `.aux`, `.log`, etc., mantendo o PDF).
- **Limpeza Total**: `make deep-clean` (Remove tudo, incluindo o PDF resultante).

O projeto utiliza a imagem Docker `texlive/texlive:latest`.

## 📁 Estrutura do Projeto

O currículo é modularizado para facilitar a manutenção:

- `main.tex`: Ponto de entrada do documento. Define a ordem das seções através de comandos `\input{sections/arquivo.tex}`.
- `config/preamble.tex`: Contém todas as configurações globais, pacotes, definições de fontes e margens.
- `sections/`: Diretório contendo o conteúdo dividido por tópicos (ex: `experience.tex`, `skills.tex`, `education.tex`).

## ✍️ Padrões de Conteúdo (Custom Commands)

Para manter a consistência visual, utilize rigorosamente os seguintes comandos personalizados:

### Experiências Profissionais (`sections/experience.tex`)
Use a estrutura de "Quad Heading" seguida por uma lista de itens:
```latex
\resumeQuadHeading{Cargo}{Período}{Empresa}{Localização}
\resumeItemListStart
    \resumeItem{Descrição de conquista ou responsabilidade.}
    \resumeItem{Outra conquista relevante.}
\resumeItemListEnd
```

### Habilidades (`sections/skills.tex`)
Use a estrutura de seções de habilidades:
```latex
\resumeHeadingListStart
    \resumeSectionType{Categoria}{:}{Item 1, Item 2, Item 3}
\resumeHeadingListEnd
```

## 🌍 Idioma e Codificação

- **Idioma**: Português do Brasil (`babel` com opção `brazilian`).
- **Codificação**: UTF-8 (`inputenc` com `utf8`). Certifique-se de que qualquer novo texto siga este padrão para evitar erros de acentuação.

## 📚 Referências
Para mais detalhes sobre a execução, consulte o [README.md](./README.md).

## 🚀 Skills Especializadas

Para tarefas complexas, consulte as instruções detalhadas nestas skills:
- [Resume Updater](./prompts/resume-updater.instructions.md): Guia para adicionar e modificar conteúdo mantendo a consistência visual.
- [LaTeX Checker](./prompts/latex-checker.instructions.md): Guia para validação sintática e prevenção de erros de compilação.
