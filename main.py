import os
import sys
from pyswip import Prolog

# 1. Configuração do Ambiente (Essencial para Windows/Python 3.13)
# Ajuste o caminho abaixo para onde o seu SWI-Prolog foi instalado
os.environ['PATH'] = r"C:\Program Files\swipl\bin" + os.pathsep + os.environ['PATH']


class PokemonExpert:
    def __init__(self, arquivo_pl):
        self.prolog = Prolog()
        try:
            # Usa caminhos absolutos para evitar erro de arquivo não encontrado
            caminho_abs = os.path.abspath(arquivo_pl).replace("\\", "/")
            self.prolog.consult(caminho_abs)
            print(f"✅ Base de Conhecimento '{arquivo_pl}' carregada com sucesso!")
        except Exception as e:
            print(f"❌ Erro ao carregar arquivo Prolog: {e}")
            sys.exit(1)

    def formatar_lista_prolog(self, lista):
        """Converte lista Python ['a', 'b'] para string Prolog '[a, b]'"""
        return "[" + ", ".join(lista) + "]"

    def realizar_diagnostico(self, time):
        print(f"\n--- 📋 DIAGNÓSTICO DO TIME ---")
        lista_pl = self.formatar_lista_prolog(time)

        # Consulta a regra de diagnóstico (Regra 25 do seu Prolog)
        query = f"diagnostico({lista_pl}, Resultado)"
        for solucao in self.prolog.query(query):
            print(f"Status: {solucao['Resultado']}")
            break

    def analisar_vulnerabilidades(self, time):
        print(f"\n--- 🔍 ANÁLISE DE FRAQUEZAS ---")
        lista_pl = self.formatar_lista_prolog(time)

        # Tipos para testar (os 15 da 1ª geração + normal)
        tipos = ["fogo", "agua", "grama", "eletrico", "gelo", "lutador",
                 "veneno", "terra", "voador", "psiquico", "inseto",
                 "pedra", "fantasma", "dragao", "normal"]

        vulneravel_a = []
        for t in tipos:
            # Consulta a regra recursiva time_vulneravel/2
            query = f"time_vulneravel({lista_pl}, {t})"
            if list(self.prolog.query(query)):
                vulneravel_a.append(t)
                print(f"⚠️ Alerta: Seu time é criticamente vulnerável a ataques do tipo: {t.upper()}")

                # Busca uma sugestão de Pokémon para cobrir essa falha
                self.buscar_sugestao(lista_pl, t)

        if not vulneravel_a:
            print("✅ Seu time não possui vulnerabilidades críticas elementais!")

    def buscar_sugestao(self, lista_pl, tipo_inimigo):
        # Consulta a regra sugerir_ajuda/3 (Usa Corte para eficiência)
        query = f"sugerir_ajuda({lista_pl}, {tipo_inimigo}, Sugestao)"
        resumos = list(self.prolog.query(query))
        if resumos:
            sugestao = resumos[0]['Sugestao']
            print(f"   💡 Dica: Considere adicionar um '{sugestao}' para balancear o time.")


# --- INTERFACE DE USUÁRIO ---
def menu():
    expert = PokemonExpert("regras.pl")  # Garanta que o nome do arquivo coincida

    print("\n==========================================")
    print("      SISTEMA ESPECIALISTA POKÉMON        ")
    print("==========================================")

    # Entrada do time pelo usuário
    print("Digite os nomes de até 6 Pokémons (separados por espaço):")
    print("Exemplo: pikachu pidgey snorlax")
    entrada = input("> ").lower().split()

    if not entrada:
        print("Nenhum Pokémon inserido. Encerrando.")
        return

    # Executa a inteligência do sistema
    expert.realizar_diagnostico(entrada)
    expert.analisar_vulnerabilidades(entrada)

    print("\n==========================================")
    print("     Obrigado por usar nosso sistema!     ")


if __name__ == "__main__":
    menu()