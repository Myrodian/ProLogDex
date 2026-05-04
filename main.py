import os
import sys
from pyswip import Prolog

os.environ['PATH'] = r"C:\Program Files\swipl\bin" + os.pathsep + os.environ['PATH']


class PokemonExpert:
    def __init__(self, arquivo_pl):
        self.prolog = Prolog()
        try:
            caminho_abs = os.path.abspath(arquivo_pl).replace("\\", "/")
            self.prolog.consult(caminho_abs)
            print("Sistema carregado com sucesso!")
        except Exception as e:
            print(f"Erro ao carregar o arquivo: {e}")
            sys.exit(1)

    def query_bool(self, expressao):
        return bool(list(self.prolog.query(expressao)))

    def query_list(self, expressao, var):
        return [str(res[var]) for res in self.prolog.query(expressao)]

    def query_single(self, expressao, var, default="N/A"):
        resultados = self.query_list(expressao, var)
        return resultados[0] if resultados else default

    def formatar_lista(self, lista):
        return "[" + ", ".join(lista) + "]"


def menu_principal():
    expert = PokemonExpert("regras.pl")

    while True:
        print("\n========================================")
        print("   SISTEMA ESPECIALISTA PROLOGDEX   ")
        print("========================================")
        print("1. Analise de Time (6 Pokemons)")
        print("2. Duelo entre dois Pokemons")
        print("3. Informacoes de um Pokemon")
        print("4. Sugestoes")
        print("5. Analise de Ameacas do Time")
        print("0. Sair")

        opcao = input("\nOpcao: ")

        if opcao == "1":
            time = input("Digite o time separado por espaco: ").lower().split()
            time_pl = expert.formatar_lista(time)

            print("\n--- Relatorio do Time ---")

            diag = expert.query_single(f"diagnostico({time_pl}, R)", "R")
            print(f"Diagnostico: {diag}")

            if expert.query_bool(f"time_completo({time_pl})"):
                print("Time completo: Sim")
            else:
                print("Time completo: Nao")

            if expert.query_bool(f"tem_lendario({time_pl})"):
                print("Possui lendario: Sim")
            else:
                print("Possui lendario: Nao")

            if expert.query_bool(f"apenas_puros({time_pl})"):
                print("Apenas tipos puros: Sim")
            else:
                print("Apenas tipos puros: Nao")

            if expert.query_bool(f"time_diverso({time_pl})"):
                print("Time diverso: Sim")
            else:
                print("Time diverso: Nao")

            tipos = expert.query_list(
                f"tipos_do_time({time_pl}, Tipos), member(T, Tipos)", "T"
            )
            print(f"Tipos no time: {', '.join(tipos)}")

            tipo_in = input("Testar cobertura contra qual tipo? ")
            if expert.query_bool(f"tem_cobertura({time_pl}, {tipo_in})"):
                print(f"O time tem cobertura contra {tipo_in}.")
            else:
                print(f"O time nao tem cobertura contra {tipo_in}!")

        elif opcao == "2":
            at = input("Atacante: ").lower()
            df = input("Defensor: ").lower()

            print(f"\n--- Duelo: {at} vs {df} ---")

            if expert.query_bool(f"vence_duelo({at}, {df})"):
                print(f"{at} vence o duelo!")
                if expert.query_bool(f"vitoria_total({at}, {df})"):
                    print("Vitoria total: o defensor nao tem como revidar.")
            else:
                print(f"{at} perde ou empata.")

            counter = expert.query_single(f"melhor_counter({df}, C)", "C")
            if counter != "N/A":
                print(f"Melhor counter para {df}: {counter}")

        elif opcao == "3":
            p = input("Nome do Pokemon: ").lower()

            if not expert.query_bool(f"pokemon({p}, _, _)"):
                print("Pokemon nao encontrado.")
                continue

            print(f"\n--- Dados de {p} ---")

            if expert.query_bool(f"eh_puro({p})"):
                print("Tipo puro: Sim")
            else:
                print("Tipo puro: Nao")

            if expert.query_bool(f"tem_tipo_duplo({p})"):
                print("Tipo duplo: Sim")
            else:
                print("Tipo duplo: Nao")

            if expert.query_bool(f"eh_lendario({p})"):
                print("Lendario: Sim")
            else:
                print("Lendario: Nao")

            if expert.query_bool(f"elite({p})"):
                print("Elite: Sim")
            else:
                print("Elite: Nao")

            outros = expert.query_list(f"mesmo_tipo({p}, Outro)", "Outro")
            if outros:
                print(f"Compartilha tipo com: {', '.join(outros[:5])}")

            counter = expert.query_single(f"counter_seguro({p}, C)", "C")
            if counter != "N/A":
                print(f"Counter seguro: {counter}")

        elif opcao == "4":
            print("1. Sugerir por tipo")
            print("2. Substituir pokemon fraco")
            print("3. Melhor counter para um inimigo")
            sub = input("Opcao: ")

            if sub == "1":
                t = input("Tipo: ").lower()
                sugs = expert.query_list(f"sugerir_por_tipo({t}, P)", "P")
                vistos = set()
                sugs_unicos = [x for x in sugs if not (x in vistos or vistos.add(x))]
                print(f"Sugestoes: {', '.join(sugs_unicos[:10])}")

            elif sub == "2":
                time = input("Time atual: ").lower().split()
                inimigo = input("Tipo do inimigo: ").lower()
                time_pl = expert.formatar_lista(time)
                res = list(expert.prolog.query(f"substituir({time_pl}, Fraco, {inimigo}, Novo)"))
                if res:
                    print(f"Tire {res[0]['Fraco']} e coloque {res[0]['Novo']}")
                else:
                    print("Nenhuma substituicao encontrada.")

            elif sub == "3":
                inimigo = input("Pokemon inimigo: ").lower()
                counter = expert.query_single(f"melhor_counter({inimigo}, C)", "C")
                if counter != "N/A":
                    print(f"Melhor counter para {inimigo}: {counter}")
                else:
                    print("Nenhum counter encontrado.")

        elif opcao == "5":
            time = input("Digite o time: ").lower().split()
            time_pl = expert.formatar_lista(time)

            print("\n--- Analise de Ameacas ---")

            tipos_atacantes = expert.query_list("vantagem(T, _)", "T")
            vistos = set()
            ameacas = []

            for tipo in tipos_atacantes:
                if tipo in vistos:
                    continue
                vistos.add(tipo)
                n_str = expert.query_single(
                    f"contar_vulneraveis({time_pl}, {tipo}, N)", "N", default="0"
                )
                try:
                    n = int(n_str)
                    if n > 0:
                        ameacas.append((tipo, n))
                except ValueError:
                    pass

            ameacas.sort(key=lambda x: -x[1])
            total = len(time)
            for tipo, n in ameacas:
                aviso = " <- PERIGO" if n > total // 2 else ""
                print(f"{tipo}: {n}/{total} vulneraveis{aviso}")

        elif opcao == "0":
            print("Saindo...")
            break

        else:
            print("Opcao invalida.")


if __name__ == "__main__":
    menu_principal()