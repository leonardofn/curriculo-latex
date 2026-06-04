# Skill: LaTeX Checker

Esta skill é especializada na validação sintática e estrutural dos arquivos `.tex` deste projeto.

## 🎯 Objetivo
Identificar erros de compilação potenciais antes de executar o build via Docker.

## 🔍 Checklist de Verificação

### 1. Integridade de Blocos (Pairing)
Verifique se cada comando de abertura possui seu fechamento correspondente:
- `\resumeItemListStart` $\rightarrow$ `\resumeItemListEnd`
- `\resumeHeadingListStart` $\rightarrow$ `\resumeHeadingListEnd`
- `\begin{...}` $\rightarrow$ `\end{...}`

### 2. Referências de Arquivos (`main.tex`)
- Verifique cada comando `\input{sections/arquivo.tex}`.
- Confirme se o arquivo referenciado realmente existe no diretório `sections/`.

### 3. Codificação e Caracteres
- Verifique a presença de caracteres especiais não escapados que possam causar erro no `pdflatex` (ex: `&`, `%`, `$`, `#`, `_` fora de contextos específicos).
- Certifique-se de que não há caracteres invisíveis ou codificações diferentes de UTF-8.

### 4. Consistência de Comandos
- Garanta que `\resumeQuadHeading` receba exatamente 4 argumentos.
- Garanta que `\resumeSectionType` receba exatamente 3 argumentos.

## 🛠️ Ações Corretivas
Se um erro for encontrado:
1. Aponte a linha exata e o arquivo.
2. Explique por que aquilo causará um erro de compilação.
3. Proponha a correção imediata.
