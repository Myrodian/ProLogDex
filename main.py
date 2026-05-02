import os

# Adicione o caminho da pasta 'bin' do seu SWI-Prolog
# Verifique se este caminho está correto no seu computador!
os.environ['PATH'] = r"C:\Program Files\swipl\bin" + os.pathsep + os.environ['PATH']

from pyswip import Prolog

# Inicializa o motor do Prolog
prolog = Prolog()

# Carrega sua base de conhecimento (fatos e reg)
prolog.consult("regras.pl")


def verificar_time(lista_pokemons, tipo_inimigo):
    """
    Chama a regra Prolog: time_vulneravel([pidgey, rattata], lutador).
    """
    # Formata a lista para o padrão do Prolog: [item1, item2]
    lista_prolog = "[" + ", ".join(lista_pokemons) + "]"

    query = f"time_vulneravel({lista_prolog}, {tipo_inimigo})"

    # Executa a consulta
    resultado = list(prolog.query(query))

    if resultado:
        print(f"⚠️ Alerta: Seu time é criticamente vulnerável ao tipo {tipo_inimigo}!")
        obter_sugestao(lista_prolog, tipo_inimigo)
    else:
        print(f"✅ Seu time possui defesas contra o tipo {tipo_inimigo}.")


def obter_sugestao(lista_prolog, tipo_inimigo):
    """
    Chama a regra Prolog: sugerir_ajuda(Time, TipoInimigo, Sugestao).
    """
    query = f"sugerir_ajuda({lista_prolog}, {tipo_inimigo}, Sugestao)"

    for solucao in prolog.query(query):
        print(f"💡 Sugestão: Adicione um {solucao['Sugestao']} ao seu time.")
        break  # Pega apenas a primeira sugestão devido ao corte (!) no Prolog


# --- INTERFACE SIMPLES ---
print("--- Sistema Especialista Pokémon ---")
meu_time = ["pidgey", "alakazam", "snorlax"]
inimigo = "X"

verificar_time(meu_time, inimigo)