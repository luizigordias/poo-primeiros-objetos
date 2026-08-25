#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

if [[ ! -t 0 ]]; then
    echo "Este comando precisa de um terminal interativo para registrar as respostas."
    exit 2
fi

if [[ ! -x /usr/bin/time ]]; then
    echo "O programa /usr/bin/time não foi encontrado. No Ubuntu/WSL, instale o pacote 'time'."
    exit 2
fi

echo "1/4 Validando as etapas 01 e 02..."
arquivo_testes="$(mktemp)"
arquivo_cpp="$(mktemp)"
arquivo_python="$(mktemp)"
trap 'rm -f "${arquivo_testes}" "${arquivo_cpp}" "${arquivo_python}"' EXIT

if ! make test ETAPA=02 >"${arquivo_testes}" 2>&1; then
    cat "${arquivo_testes}"
    echo
    echo "Os testes falharam. Corrija o programa antes de gerar a evidência."
    exit 1
fi

echo "2/4 Medindo cada programa três vezes..."
for _ in 1 2 3; do
    /usr/bin/time -f "%e" -o "${arquivo_cpp}" -a ./build/sensor >/dev/null
    /usr/bin/time -f "%e" -o "${arquivo_python}" -a \
        env PYTHONPATH=src python3 src/main.py >/dev/null
done

echo "3/4 Responda com suas próprias palavras. Não deixe respostas em branco."
ler_resposta() {
    local pergunta="$1"
    local resposta=""

    while [[ -z "${resposta// }" ]]; do
        printf '\n%s\n> ' "${pergunta}" >&2
        IFS= read -r resposta
    done

    printf '%s' "${resposta}"
}

resposta_fluxo="$(ler_resposta "1. Qual diferença você observou entre executar C++ e Python nesta atividade?")"
resposta_tempo="$(ler_resposta "2. O que as medições com time permitem observar e o que elas não provam?")"
resposta_compatibilidade="$(ler_resposta "3. Como sua solução preserva a construção antiga com dois argumentos?")"
resposta_invalido="$(ler_resposta "4. Por que ainda é possível criar um sensor com valor inválido, como -30%?")"

mapfile -t tempos_cpp <"${arquivo_cpp}"
mapfile -t tempos_python <"${arquivo_python}"

branch="$(git branch --show-current 2>/dev/null || printf 'não identificada')"
commit="$(git rev-parse --short HEAD 2>/dev/null || printf 'não identificado')"
data="$(date --iso-8601=seconds)"

printf '%s\n' \
    "# Evidência — capítulo 03" \
    "" \
    "- Data: ${data}" \
    "- Branch: \`${branch}\`" \
    "- Commit-base antes da geração: \`${commit}\`" \
    "- Validação local: \`make test ETAPA=02\` — aprovada" \
    "" \
    "## Medições com time" \
    "" \
    "| Execução | C++ (real, s) | Python (real, s) |" \
    "|---|---:|---:|" \
    "| 1 | ${tempos_cpp[0]} | ${tempos_python[0]} |" \
    "| 2 | ${tempos_cpp[1]} | ${tempos_python[1]} |" \
    "| 3 | ${tempos_cpp[2]} | ${tempos_python[2]} |" \
    "" \
    "## Respostas da prática" \
    "" \
    "### 1. Diferença observada entre os fluxos" \
    "" \
    "${resposta_fluxo}" \
    "" \
    "### 2. Limites da medição" \
    "" \
    "${resposta_tempo}" \
    "" \
    "### 3. Preservação da construção anterior" \
    "" \
    "${resposta_compatibilidade}" \
    "" \
    "### 4. Estado inválido ainda permitido" \
    "" \
    "${resposta_invalido}" \
    > evidencia.md

echo
echo "4/4 Evidência gerada em evidencia.md"
echo "Revise o arquivo antes de fazer commit e enviar ao Classroom."
