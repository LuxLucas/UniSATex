# Projeto LaTeX (UniSatex)

Este projeto está configurado para ser desenvolvido e compilado diretamente no **VSCode** utilizando a extensão **LaTeX Workshop**. O ambiente foi otimizado para manter o diretório limpo, isolando todos os arquivos auxiliares de compilação em uma pasta dedicada.

---

## Pré-requisitos

Para compilar este projeto localmente, você precisa ter duas ferramentas principais instaladas no sistema:

1. **Distribuição LaTeX (MiKTeX):** Responsável pelo motor de compilação (`pdflatex`, `bibtex`).
2. **Visual Studio Code:** O editor de código.
3. **Extensão LaTeX Workshop:** Extensão instalada dentro do VS Code.

---

## Configuração do Ambiente no VS Code

Como o motor do LaTeX (`MiKTeX`) pode não estar registrado globalmente nas variáveis de ambiente do seu sistema, o VS Code precisa saber o caminho exato do executável. 

Abaixo está o arquivo de configuração necessário. Ele já define o caminho do compilador e instrui o projeto a salvar tudo dentro da pasta `build`.

### Passo a passo para aplicar as configurações:
1. No VS Code, abra a Paleta de Comandos (`Ctrl + Shift + P`).
2. Digite **"Preferences: Open User Settings (JSON)"** e selecione-a.
3. Insira as seguintes propriedades dentro do arquivo (substituindo ou adicionando ao seu JSON existente):

```json
{
    "latex-workshop.latex.outDir": "%DIR%/build",
    "latex-workshop.latex.auxDir": "%DIR%/build",
    "latex-workshop.latex.autoClean.run": "onBuilt",
    "latex-workshop.latex.recipes": [
        {
            "name": "pdflatex ➞ bibtex ➞ pdflatex × 2",
            "tools": [
                "pdflatex",
                "bibtex",
                "pdflatex",
                "pdflatex"
            ]
        }
    ],
    "latex-workshop.latex.tools": [
        {
            "name": "pdflatex",
            "command": "pdflatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "--output-directory=%OUTDIR%",
                "%DOC%"
            ],
            "env": {
                "Path": "C:\\Users\\UserName\\AppData\\Local\\Programs\\MiKTeX\\miktex\\bin\\x64;%Path%"
            }
        },
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": [
                "%OUTDIR%/%DOCFILE%"
            ],
            "env": {
                "Path": "C:\\Users\\UserName\\AppData\\Local\\Programs\\MiKTeX\\miktex\\bin\\x64;%Path%"
            }
        }
    ]
}
```

---

## Como Executar e Compilar o Arquivo

Após abrir a pasta do projeto no VS Code (`File > Open Folder...`), siga as instruções de execução:

1. **Definição do Arquivo Raiz:** Garanta que a primeira linha do seu arquivo principal (`main.tex`) contenha a linha abaixo para indicar à extensão que ele é o ponto de entrada:
   ```latex
   % !TEX root = main.tex
   ```
2. **Compilação:** Abra o arquivo `main.tex` e pressione o atalho **`Ctrl + Alt + B`** (ou simplesmente salve o arquivo `Ctrl + S`).
3. **Visualizar o PDF (Preview):** Pressione o atalho **`Ctrl + Alt + V`** para abrir o visualizador de PDF integrado dividindo a tela com o seu código.

### Estrutura de Pastas Gerada
Durante a compilação, o projeto criará a seguinte estrutura:
* `main.tex` (Seu arquivo de código-fonte principal)
* `build/` (Pasta gerada automaticamente)
  * `main.pdf` (Seu documento PDF finalizado)
  * *(Todos os arquivos de sujeira como .aux, .log, .toc ficarão isolados aqui dentro)*

---

## Atalhos Úteis do LaTeX Workshop

* **`Ctrl + Alt + B`** ➞ Compila o projeto manualmente.
* **`Ctrl + Alt + V`** ➞ Abre a pré-visualização do PDF na aba ao lado.
* **`Ctrl + Alt + J`** ➞ **SyncTeX Forward**: Coloque o cursor em uma linha do código e use este atalho para o PDF pular exatamente para o parágrafo correspondente.
