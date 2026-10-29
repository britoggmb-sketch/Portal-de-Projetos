#!/usr/bin/env bash
# Procura dados pessoais e termos proibidos nos arquivos versionados.
# Uso: bash scripts/verificar-dados-sensiveis.sh
set -u
cd "$(dirname "$0")/.."
ALVOS=$(git ls-files 2>/dev/null || find . -type f -not -path './.git/*')
ALVOS=$(printf '%s\n' $ALVOS | grep -Ev '\.(woff2?|png|jpe?g|gif|ico)$' | grep -vE 'verificar-dados-sensiveis.sh|\.termos-proibidos')
achou=0
checar () {
  local rotulo="$1" regex="$2"
  local res
  res=$(printf '%s\n' $ALVOS | xargs grep -nIoE "$regex" 2>/dev/null | grep -vE "$3" | head -20)
  if [ -n "$res" ]; then echo "⚠️  $rotulo:"; echo "$res"; echo; achou=1; fi
}
checar "Possível CPF"      '[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}' '^$'
checar "Possível CNPJ"     '[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}' '^$'
checar "Possível telefone" '\(?[0-9]{2}\)? ?9[0-9]{4}-[0-9]{4}' '^$'
checar "E-mail fora de exemplo.com" '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' '@(exemplo|empresa|example)\.(com|org)'
if [ -f .termos-proibidos ]; then
  while IFS= read -r termo; do
    [ -z "$termo" ] && continue
    res=$(printf '%s\n' $ALVOS | xargs grep -nIiF -- "$termo" 2>/dev/null | head -10)
    if [ -n "$res" ]; then echo "⚠️  Termo proibido \"$termo\":"; echo "$res" | cut -c1-200; echo; achou=1; fi
  done < .termos-proibidos
else
  echo "ℹ️  Crie um arquivo .termos-proibidos (um termo por linha) para checar nomes de clientes e da empresa."
fi
if [ $achou -eq 0 ]; then echo "✅ Nenhum dado sensível encontrado."; else echo "❌ Revise os itens acima antes do commit."; exit 1; fi
