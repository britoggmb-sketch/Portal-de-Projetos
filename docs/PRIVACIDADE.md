# Privacidade e conformidade com a LGPD

Os dois projetos nasceram em contexto profissional. Antes da publicação, tudo o que identificava a empresa empregadora, seus clientes ou pessoas reais foi retirado.

## O que foi removido

- **Identidade visual corporativa:** logotipos (incluídos como imagens no código), paleta de cores, tipografia proprietária, grafismo de círculos, slogan e nomes da marca. No lugar, há uma identidade neutra criada para o portfólio (azul-céu sobre ardósia, Space Grotesk, Schibsted Grotesk, Overpass e Inter).
- **Nomes de empresas e domínios:** nomes da empresa, do produto interno e o domínio de e-mail corporativo foram trocados por termos genéricos (`exemplo.com`).
- **Dados de clientes e projetos:** nenhum dado salvo nos ambientes originais foi exportado. O Portal de Projetos traz apenas um projeto de demonstração inventado ("Empresa Exemplo S.A. (fictícia)", pessoas com nomes fictícios).
- **Chaves de armazenamento:** as chaves do `localStorage` que levavam o nome da empresa foram renomeadas.

## Como os projetos tratam dados pessoais

- Os dados digitados ficam somente no navegador de quem usa (`localStorage`). Não há servidor, banco de dados, analytics nem cookies de terceiros.
- As fontes são servidas pelo próprio repositório, para que abrir a página não envie o IP do visitante ao Google Fonts.
- As bibliotecas de leitura de arquivos (pdf.js, SheetJS etc.) são baixadas do cdnjs apenas quando o usuário envia um documento. Os arquivos são lidos no próprio navegador.
- A IAM Academy pede consentimento explícito antes de guardar nome e e-mail, e informa a finalidade.

## Antes de cada commit

1. Nunca use dados reais em demonstrações, capturas de tela ou exemplos. Use nomes fictícios e `exemplo.com`.
2. Crie, só na sua máquina, um arquivo `.termos-proibidos` com um termo por linha (nomes de clientes, da empresa, de colegas). Ele já está no `.gitignore`.
3. Rode o verificador:

```bash
bash scripts/verificar-dados-sensiveis.sh
```

Ele procura CPFs, CNPJs, telefones, e-mails fora de `exemplo.com` e os termos da sua lista. Se encontrar algo, o comando falha e mostra onde.

Se algum dado real já tiver ido para um commit, apagar o arquivo não basta: o histórico do Git guarda a versão antiga. Nesse caso, reescreva o histórico (por exemplo, com `git filter-repo`) ou recrie o repositório.
