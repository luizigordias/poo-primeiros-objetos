# Do C aos primeiros objetos em C++ e Python

Repositório-base cumulativo do capítulo 03 do curso de Programação Orientada a Objetos.

O código inicial **compila e executa**, mas ainda imprime marcadores `TODO`. Complete somente os pontos indicados usando o material publicado no GitHub Pages. Os mesmos contratos são validados localmente e no GitHub Actions.

## Requisitos

- Git configurado para acessar o GitHub;
- `g++` com suporte a C++17;
- Python 3;
- GNU Make;
- terminal Linux, macOS ou Ubuntu no WSL.

## Fluxo de trabalho

1. Faça fork deste repositório para sua conta.
2. Clone o seu fork e configure o repositório original como `upstream`.
3. Execute o baseline antes de editar.
4. Trabalhe nas branches indicadas, em ordem.
5. Rode `make test ETAPA=...` antes de cada push.
6. Consulte **Actions > Validação do capítulo 03** depois do push.
7. Integre a branch somente quando a validação estiver verde.

| Etapa | Branch obrigatória | Objetivo | Teste local |
|---|---|---|---|
| 1 | `pratica/01-primeiros-objetos` | completar classe, construção e exibição em C++ e Python | `make test ETAPA=01` |
| 2 | `pratica/02-extensao-unidade` | acrescentar unidade aos dois modelos sem regressão | `make test ETAPA=02` |

## Baseline

```bash
make build
make run
```

Saída inicial intencional:

```text
TODO C++
TODO Python
```

Os testes devem falhar até que cada contrato seja implementado. Não altere `.github/`, `tests/` ou `Makefile` para contornar a validação.

## Estrutura

```text
.
├── .github/workflows/validacao.yml
├── include/sensor_nivel.hpp
├── src/
│   ├── main.cpp
│   ├── main.py
│   ├── sensor_nivel.cpp
│   └── sensor_nivel.py
├── tests/
├── Makefile
├── CONTRIBUTING.md
├── GUIA_DOCENTE.md
└── AI_LOG.md
```

## Limite da automação

Os testes visíveis confirmam saídas e partes do contrato, mas não provam compreensão nem qualidade completa. A entrega inclui explicação no PR e pode ser acompanhada de defesa oral.
