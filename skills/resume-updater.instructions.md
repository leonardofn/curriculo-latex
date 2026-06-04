# Skill: Resume Updater

Esta skill orienta a atualização de conteúdo no currículo LaTeX, garantindo que a estrutura visual seja mantida rigorosamente.

## 🎯 Objetivo
Adicionar ou modificar experiências profissionais, projetos ou habilidades sem quebrar a formatação do template.

## 🛠️ Fluxo de Trabalho para Experiências (`sections/experience.tex`)

Ao editar experiências, siga obrigatoriamente estes passos:

1. **Validação de Parâmetros**: Antes de aplicar a alteração, verifique se você possui as 4 informações necessárias para o comando `\resumeQuadHeading`:
   - **Cargo**: Título da posição.
   - **Período**: Datas de início e fim (ou "Atual").
   - **Empresa**: Nome da organização.
   - **Localização**: Cidade/Estado ou "Remoto".
   - *Se alguma informação estiver faltando, solicite ao usuário antes de editar.*

2. **Estrutura de Itens**:
   - Cada experiência DEVE começar com `\resumeQuadHeading{...}{...}{...}{...}`.
   - As conquistas DEVE estar envoltas em `\resumeItemListStart` e `\resumeItemListEnd`.
   - Cada ponto deve usar `\resumeItem{...}`.

## 🛠️ Fluxo de Trabalho para Habilidades (`sections/skills.tex`)

1. **Identificação da Categoria**: Localize a categoria correta (ex: Linguagens, Frameworks) dentro de `\resumeHeadingListStart` e `\resumeHeadingListEnd`.
2. **Adição de Itens**: Use o formato `\resumeSectionType{Categoria}{:}{Item 1, Item 2, Item 3}`.
3. **Consistência**: Mantenha a separação por vírgulas e a ordem alfabética se for o padrão da seção.

## ⚠️ Regras Críticas
- Nunca remova os comandos de início e fim de lista (`Start` e `End`).
- Mantenha a codificação UTF-8 para evitar erros de acentuação em Português.
- Sempre sugira rodar `make pdflatex` após a edição para validar a sintaxe.
