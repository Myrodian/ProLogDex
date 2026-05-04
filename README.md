# ProLogDex

Um sistema para simulacao, sugestao e duelo de Pokemons.

Trabalho pratico da disciplina de Paradigmas de Linguagens do curso de Ciencia da Computacao.
O objetivo foi desenvolver um sistema especialista em Prolog sobre um assunto escolhido pelo aluno.
O tema escolhido foi a primeira geracao de Pokemon (Kanto).

## Sobre o projeto

O sistema e capaz de responder consultas sobre Pokemon, como duelos entre dois Pokemon, analise de times, sugestoes de Pokemon por tipo, entre outras funcionalidades. A base de conhecimento foi escrita em Prolog e a interface com o usuario foi feita em Python usando a biblioteca `pyswip`.

## Tecnologias

- **Prolog (SWI-Prolog)** — base de conhecimento e regras de inferencia
- **Python 3** — interface de terminal
- **pyswip** — biblioteca que conecta Python ao SWI-Prolog

## Estrutura do projeto

```
/
├── regras.pl   # Base de fatos e regras em Prolog
├── main.py     # Interface de terminal em Python
└── README.md
```

## Base de conhecimento

### Fatos

- Mais de 100 Pokemon da geracao Kanto com seus tipos primario e secundario
- Tabela completa de vantagens de tipo
- Tabela de imunidades

### Regras (28 no total)

Algumas das principais regras implementadas:

| Regra | Descricao |
|---|---|
| `vence_duelo/2` | Verifica se um Pokemon vence o duelo contra outro baseado nos tipos |
| `vulneravel/3` | Verifica se um Pokemon e vulneravel a determinado tipo |
| `time_vulneravel/2` | Verifica se todos os membros do time sao vulneraveis ao mesmo tipo (recursividade) |
| `apenas_puros/1` | Verifica se todos os Pokemon do time sao de tipo puro (recursividade) |
| `time_tematico/2` | Verifica se todos os Pokemon do time pertencem ao mesmo tipo (recursividade) |
| `super_eficaz/2` | Verifica se o atacante tem vantagem sobre os dois tipos do defensor |
| `vitoria_total/2` | Verifica se o atacante e super eficaz e o defensor nao consegue revidar |
| `counter_seguro/2` | Retorna um Pokemon que vence o inimigo sem risco de contra-ataque |
| `melhor_counter/2` | Prioriza vitoria total, senao retorna counter seguro |
| `substituir/4` | Sugere a troca de um Pokemon fraco do time por um mais adequado |
| `diagnostico/2` | Retorna se o time e Perigoso ou Equilibrado |
| `contar_vulneraveis/3` | Conta quantos membros do time sao vulneraveis a um tipo (findall) |
| `tipos_do_time/2` | Retorna os tipos distintos presentes no time (findall) |
| `time_diverso/1` | Verifica se o time possui ao menos 3 tipos diferentes |

O codigo faz uso de **cortes** para eficiencia (ex: `vence_duelo`, `counter_seguro`), **recursividade** (ex: `time_vulneravel`, `apenas_puros`, `time_tematico`) e **listas com findall** (ex: `contar_vulneraveis`, `tipos_do_time`).

## Como executar

### Pre-requisitos

- [SWI-Prolog](https://www.swi-prolog.org/Download.html) instalado
- Python 3 instalado
- Instalar a biblioteca pyswip:

```bash
pip install pyswip
```

### Executando

Clone o repositorio e execute o arquivo principal:

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
python main.py
```

> Se estiver no Windows, verifique se o caminho do SWI-Prolog esta correto na linha 4 do `main.py`.

## Funcionalidades do terminal

```
1. Analise de Time (6 Pokemons)
2. Duelo entre dois Pokemons
3. Informacoes de um Pokemon
4. Sugestoes
5. Analise de Ameacas do Time
0. Sair
```

### Exemplos de uso

**Duelo:**
```
Atacante: pikachu
Defensor: lapras
pikachu vence o duelo!
```

**Analise de ameacas:**
```
Time: pikachu charizard arcanine flareon magmar moltres
pedra: 5/6 vulneraveis <- PERIGO
agua: 4/6 vulneraveis <- PERIGO
```

**Substituicao:**
```
Time atual: pikachu charizard arcanine flareon magmar moltres
Tipo do inimigo: pedra
Tire charizard e coloque squirtle
```

## Observacoes

- Os duelos sao decididos **apenas por tipo**. Lendarios nao possuem nenhum bonus automatico em batalha.
- Todo lendario e considerado elite, mas nem todo elite e lendario (Pokemon de tipo duplo tambem sao elite).
- A base cobre apenas a primeira geracao (Kanto), com os tipos originais do jogo.

## Autores

Desenvolvido por Augusto César Leal e Luis Fernando Almeida Nunes para a disciplina de Paradigmas de Linguagens — Instituto Federal de Minas Gerais, Campus Formiga.
