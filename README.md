# Portfólio: Portal de Projetos e IAM Academy

Dois projetos web de página única, feitos em HTML, CSS e JavaScript puro, sem build e sem backend. Cada um roda abrindo o `index.html` no navegador ou publicando o repositório no GitHub Pages.

| Projeto | O que faz | Pasta |
|---|---|---|
| **Portal de Projetos** | Carteira de projetos com farol de saúde, KPIs, Gantt interativo, Curva S, histórico de mudanças, status report editável e exportação em PDF e Markdown. Lê documentos (PDF, Word, Excel, exportações do Jira) e sugere atualizações no plano. | [`portal-projetos/`](portal-projetos/) |
| **IAM Academy** | Plataforma de estudos para certificações de segurança de identidade (SailPoint e Ping Identity): trilhas, módulos com glossário, quizzes, simulados cronometrados, relatório de lacunas e painel de administração de conteúdo. | [`iam-academy/`](iam-academy/) |

## Como rodar

**Localmente:** clone o repositório e sirva a pasta (as fontes são carregadas por caminho relativo):

```bash
git clone https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git
cd SEU-REPOSITORIO
python3 -m http.server 8000
# abra http://localhost:8000
```

**GitHub Pages:** em *Settings → Pages*, escolha a branch `main` e a pasta `/ (root)`. A página inicial (`index.html`) leva aos dois projetos.

## Modo de demonstração

Os dois projetos funcionam sozinhos no navegador, guardando os dados no `localStorage` de quem usa. Nada é enviado para servidores.

- **Portal de Projetos** abre com um projeto de exemplo totalmente fictício. Dá para criar projetos, editar demandas, arrastar barras do Gantt, gerar o status report e exportar.
- **IAM Academy** tem contas de teste sem senha (botões *Aluno* e *Administrador* na tela de entrada).

Os recursos que usam IA (interpretar documentos com linguagem natural, gerar perguntas, traduzir materiais) dependem do ambiente de artefatos do Claude, onde os projetos foram criados. Fora dele, os projetos usam uma leitura simplificada por regras e avisam isso na tela.

## Tecnologias

HTML5, CSS3 (variáveis, grid, tema claro e escuro), JavaScript ES2020 sem frameworks, SVG para gráficos. Bibliotecas carregadas sob demanda via cdnjs: pdf.js, mammoth, SheetJS, JSZip, html2canvas e jsPDF. Fontes de código aberto (SIL OFL) servidas a partir do próprio repositório.

## Privacidade e dados

Este repositório não contém dados de clientes, de empresas ou de pessoas reais. Veja [`docs/PRIVACIDADE.md`](docs/PRIVACIDADE.md) para o que foi removido e como manter assim em commits futuros.

## Aviso de marcas

SailPoint, Ping Identity e demais nomes de produtos citados são marcas de seus respectivos titulares. Este é um projeto pessoal de estudo, sem vínculo com esses fabricantes, e não reproduz questões de exames oficiais.

## Licença

[MIT](LICENSE)
