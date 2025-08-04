# Currículo Profissional com LaTeX

Este repositório contém o código-fonte de um currículo profissional desenvolvido em LaTeX. O objetivo é criar um documento bem estruturado, elegante e fácil de personalizar.

## Estrutura do Projeto

```text
├── main.tex                # Arquivo principal do documento
├── config/
│   └── preamble.tex        # Configurações e pacotes utilizados
├── sections/
│   ├── certifications.tex  # Seção de certificações
│   ├── contacts.tex        # Seção de contatos
│   ├── education.tex       # Seção de educação
│   ├── experience.tex      # Seção de experiência profissional
│   ├── profile.tex         # Seção de perfil profissional
│   ├── projects.tex        # Seção de projetos
│   └── skills.tex          # Seção de habilidades
├── .gitignore              # Arquivo para ignorar arquivos desnecessários no Git
└── README.md               # Este arquivo
```

## Como Usar

1. Certifique-se de ter o LaTeX instalado em sua máquina. Recomendamos o uso do [TeX Live](https://www.tug.org/texlive/) ou [MikTeX](https://miktex.org/).

2. Clone este repositório:

   ```bash
   git clone https://github.com/leonardofn/curriculo-latex.git
   ```

3. Navegue até o diretório do projeto:

   ```bash
   cd curriculo-latex
   ```

4. Compile o arquivo `main.tex` usando o comando:

   ```bash
   pdflatex main.tex
   ```

5. O arquivo PDF gerado estará disponível no mesmo diretório.

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
