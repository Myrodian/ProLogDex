% Formato: pokemon(Nome, TipoPrimario, TipoSecundario).
% Quando o Pokémon possui apenas um tipo, TipoSecundario = nenhum.

% --- Tipo Normal ---
pokemon(pidgey,     normal, voador).
pokemon(pidgeotto,  normal, voador).
pokemon(pidgeot,    normal, voador).
pokemon(rattata,    normal, nenhum).
pokemon(raticate,   normal, nenhum).
pokemon(spearow,    normal, voador).
pokemon(fearow,     normal, voador).
pokemon(jigglypuff, normal, nenhum).
pokemon(wigglytuff, normal, nenhum).
pokemon(meowth,     normal, nenhum).
pokemon(persian,    normal, nenhum).
pokemon(eevee,      normal, nenhum).
pokemon(porygon,    normal, nenhum).
pokemon(snorlax,    normal, nenhum).
pokemon(doduo,      normal, voador).
pokemon(dodrio,     normal, voador).
pokemon(kangaskhan, normal, nenhum).
pokemon(ditto,      normal, nenhum).

% --- Tipo Fogo ---
pokemon(charmander, fogo, nenhum).
pokemon(charmeleon, fogo, nenhum).
pokemon(charizard,  fogo, voador).
pokemon(vulpix,     fogo, nenhum).
pokemon(ninetales,  fogo, nenhum).
pokemon(growlithe,  fogo, nenhum).
pokemon(arcanine,   fogo, nenhum).
pokemon(magmar,     fogo, nenhum).
pokemon(flareon,    fogo, nenhum).
pokemon(moltres,    fogo, voador).   % Lendário Pássaro de Fogo

% --- Tipo Água ---
pokemon(squirtle,   agua, nenhum).
pokemon(wartortle,  agua, nenhum).
pokemon(blastoise,  agua, nenhum).
pokemon(psyduck,    agua, nenhum).
pokemon(golduck,    agua, nenhum).
pokemon(poliwag,    agua, nenhum).
pokemon(tentacool,  agua, veneno).
pokemon(vaporeon,   agua, nenhum).
pokemon(lapras,     agua, gelo).
pokemon(staryu,     agua, nenhum).
pokemon(starmie,    agua, psiquico).

% --- Tipo Grama ---
pokemon(bulbasaur,  grama, veneno).
pokemon(ivysaur,    grama, veneno).
pokemon(venusaur,   grama, veneno).
pokemon(oddish,     grama, veneno).
pokemon(vileplume,  grama, veneno).
pokemon(exeggutor,  grama, psiquico).
pokemon(tangela,    grama, nenhum).

% --- Tipo Elétrico ---
pokemon(pikachu,    eletrico, nenhum).
pokemon(raichu,     eletrico, nenhum).
pokemon(magnemite,  eletrico, nenhum).
pokemon(magneton,   eletrico, nenhum).
pokemon(jolteon,    eletrico, nenhum).
pokemon(electabuzz, eletrico, nenhum).
pokemon(zapdos,     eletrico, voador). % Lendário Pássaro Elétrico

% --- Tipo Gelo ---
pokemon(jynx,       gelo, psiquico).
pokemon(articuno,   gelo, voador).   % Lendário Pássaro de Gelo

% --- Tipo Terra ---
pokemon(cubone,     terra, nenhum).
pokemon(marowak,    terra, nenhum).
pokemon(rhyhorn,    terra, pedra).
pokemon(rhydon,     terra, pedra).
pokemon(sandshrew,  terra, nenhum).
pokemon(sandslash,  terra, nenhum).
pokemon(diglett,    terra, nenhum).
pokemon(dugtrio,    terra, nenhum).

% --- Tipo Pedra ---
pokemon(geodude,    pedra, terra).
pokemon(graveler,   pedra, terra).
pokemon(golem,      pedra, terra).
pokemon(onix,       pedra, terra).
pokemon(kabuto,     pedra, agua).
pokemon(kabutops,   pedra, agua).
pokemon(omanyte,    pedra, agua).
pokemon(omastar,    pedra, agua).
pokemon(aerodactyl, pedra, voador).

% --- Tipo Inseto ---
pokemon(scyther,    inseto, voador).
pokemon(pinsir,     inseto, nenhum).
pokemon(caterpie,   inseto, nenhum).
pokemon(butterfree, inseto, voador).
pokemon(beedrill,   inseto, veneno).
pokemon(paras,      inseto, grama).
pokemon(parasect,   inseto, grama).

% --- Tipo Psíquico ---
pokemon(alakazam,   psiquico, nenhum).
pokemon(mewtwo,     psiquico, nenhum).
pokemon(kadabra,    psiquico, nenhum).
pokemon(hypno,      psiquico, nenhum).
pokemon(mr_mime,    psiquico, nenhum).

% --- Tipo Lutador ---
pokemon(machamp,    lutador, nenhum).
pokemon(machoke,    lutador, nenhum).
pokemon(hitmonlee,  lutador, nenhum).
pokemon(hitmonchan, lutador, nenhum).

% --- Tipo Veneno ---
pokemon(koffing,    veneno, nenhum).
pokemon(weezing,    veneno, nenhum).
pokemon(ekans,      veneno, nenhum).
pokemon(arbok,      veneno, nenhum).
pokemon(nidoran_m,  veneno, nenhum).
pokemon(nidorino,   veneno, nenhum).
pokemon(nidoking,   veneno, terra).
pokemon(nidoran_f,  veneno, nenhum).
pokemon(nidorina,   veneno, nenhum).
pokemon(nidoqueen,  veneno, terra).

% --- Tipo Fantasma ---
pokemon(gengar,     fantasma, veneno).
pokemon(haunter,    fantasma, veneno).
pokemon(gastly,     fantasma, veneno).

% --- Tipo Dragão ---
pokemon(dragonite,  dragao, voador).
pokemon(dragonair,  dragao, nenhum).
pokemon(dratini,    dragao, nenhum).

% ------------------------------------------------------------------------------
% VANTAGENS DE TIPO: vantagem(TipoAtacante, TipoDefensor).
% Representa que o tipo atacante causa dano dobrado no tipo defensor.
% ------------------------------------------------------------------------------
vantagem(fogo,     grama).
vantagem(fogo,     gelo).
vantagem(fogo,     inseto).
vantagem(agua,     fogo).
vantagem(agua,     terra).
vantagem(agua,     pedra).
vantagem(grama,    agua).
vantagem(grama,    terra).
vantagem(grama,    pedra).
vantagem(eletrico, agua).
vantagem(eletrico, voador).
vantagem(gelo,     grama).
vantagem(gelo,     terra).
vantagem(gelo,     voador).
vantagem(gelo,     dragao).
vantagem(lutador,  normal).
vantagem(lutador,  gelo).
vantagem(lutador,  pedra).
vantagem(veneno,   grama).
vantagem(veneno,   inseto).
vantagem(terra,    fogo).
vantagem(terra,    eletrico).
vantagem(terra,    veneno).
vantagem(terra,    pedra).
vantagem(voador,   grama).
vantagem(voador,   lutador).
vantagem(voador,   inseto).
vantagem(psiquico, lutador).
vantagem(psiquico, veneno).
vantagem(inseto,   grama).
vantagem(inseto,   psiquico).
vantagem(inseto,   veneno).
vantagem(pedra,    fogo).
vantagem(pedra,    gelo).
vantagem(pedra,    voador).
vantagem(pedra,    inseto).
vantagem(fantasma, psiquico).
vantagem(fantasma, fantasma).
vantagem(dragao,   dragao).

% IMUNIDADES: imunidade(TipoDefensor, TipoAtacante).
% O tipo Defensor é completamente imune a ataques do tipo Atacante.

imunidade(terra,    eletrico).  % Terra é imune a Elétrico
imunidade(voador,   terra).     % Voador é imune a Terra
imunidade(fantasma, normal).    % Fantasma é imune a Normal
imunidade(fantasma, lutador).   % Fantasma é imune a Lutador
imunidade(normal,   fantasma).  % Normal é imune a Fantasma
imunidade(psiquico, fantasma).  % Bug de Gen I: Psíquico era imune a Fantasma

% 2. BASE DE REGRAS (28 regras)

% --- REGRAS 1 e 2: Duelo entre dois Pokémons ---
% Usa corte (!) para eficiência: detecta imunidade e falha imediatamente.
vence_duelo(Atacante, Defensor) :-
    pokemon(Atacante, TipoA, _),
    pokemon(Defensor, TipoD, _),
    imunidade(TipoD, TipoA), !, fail.

vence_duelo(Atacante, Defensor) :-
    pokemon(Atacante, T1_A, T2_A),
    pokemon(Defensor, T1_D, T2_D),
    (   vantagem(T1_A, T1_D)
    ;   vantagem(T1_A, T2_D)
    ;   vantagem(T2_A, T1_D)
    ;   vantagem(T2_A, T2_D)
    ), !.

% --- REGRA 3: Vulnerabilidade Individual ---
% Usa corte para retornar apenas o primeiro resultado e evitar duplicatas.
vulneravel(Pokemon, TipoAtacante) :-
    pokemon(Pokemon, T1, T2),
    (vantagem(TipoAtacante, T1) ; vantagem(TipoAtacante, T2)), !.

% --- REGRAS 4 e 5: Time Vulnerável (Recursividade + Listas) ---
% Verdadeiro se TODOS os membros do time são vulneráveis ao tipo informado.
time_vulneravel([], _).
time_vulneravel([H|T], TipoAtacante) :-
    vulneravel(H, TipoAtacante),
    time_vulneravel(T, TipoAtacante).

% --- REGRA 6: Sugestão de Ajuda ---
% Usa corte para retornar apenas a primeira sugestão viável.
sugerir_ajuda(Time, TipoInimigo, Sugestao) :-
    vantagem(TipoSugestao, TipoInimigo),
    pokemon(Sugestao, TipoSugestao, _),
    \+ member(Sugestao, Time), !.

% --- REGRA 7: Pokémon de Tipo Puro ---
eh_puro(P) :- pokemon(P, _, nenhum).

% --- REGRA 8: Compartilhamento de Tipo ---
mesmo_tipo(P1, P2) :-
    pokemon(P1, T, _), pokemon(P2, T, _), P1 \= P2.

% --- REGRA 9: Pokémons Lendários de Kanto ---
eh_lendario(mewtwo).
eh_lendario(articuno).
eh_lendario(zapdos).
eh_lendario(moltres).
eh_lendario(dragonite).   % Pseudo-lendário

% --- REGRA 10: Sugerir por Tipo ---
% Retorna Pokémons cujo tipo primário ou secundário corresponde ao solicitado.
sugerir_por_tipo(Tipo, P) :- pokemon(P, Tipo, _).
sugerir_por_tipo(Tipo, P) :- pokemon(P, _, Tipo), Tipo \= nenhum.

% --- REGRA 11: Tipo Duplo ---
tem_tipo_duplo(P) :- pokemon(P, _, T2), T2 \= nenhum.

% --- REGRA 12: Resistência ---
% Um Pokémon é resistente a um tipo se não é vulnerável a ele.
resistente(P, TipoAtacante) :- \+ vulneravel(P, TipoAtacante).

% --- REGRA 13: Super Eficaz ---
% O atacante possui vantagem sobre AMBOS os tipos do defensor (tipo duplo).
% Verifica primeiro com o tipo primário do atacante, depois com o secundário.
super_eficaz(At, Def) :-
    pokemon(At, T1_A, _),
    pokemon(Def, D1, D2), D2 \= nenhum,
    vantagem(T1_A, D1), vantagem(T1_A, D2), !.
super_eficaz(At, Def) :-
    pokemon(At, _, T2_A), T2_A \= nenhum,
    pokemon(Def, D1, D2), D2 \= nenhum,
    vantagem(T2_A, D1), vantagem(T2_A, D2), !.

% --- REGRA 14: Cobertura de Time ---
% O time tem ao menos um Pokémon que não é vulnerável ao tipo inimigo.
tem_cobertura(Time, TipoIn) :- member(P, Time), \+ vulneravel(P, TipoIn).

% --- REGRA 15: Time Temático (Recursividade + Listas) ---
% Todos os Pokémons do time possuem o tipo informado (primário ou secundário).
time_tematico([], _).
time_tematico([H|T], Tipo) :-
    (pokemon(H, Tipo, _) ; pokemon(H, _, Tipo)),
    time_tematico(T, Tipo).

% --- REGRA 16: Counter Seguro ---
% Retorna um Pokémon que vence o inimigo sem risco de contra-ataque.
% Usa corte para retornar apenas o primeiro resultado.
counter_seguro(Inimigo, Sugestao) :-
    vence_duelo(Sugestao, Inimigo),
    \+ vence_duelo(Inimigo, Sugestao), !.

% --- REGRA 17: Time com Lendário ---
tem_lendario(Time) :- member(P, Time), eh_lendario(P).

% --- REGRA 18: Apenas Puros (Recursividade + Listas) ---
% Verdadeiro se todos os Pokémons do time são de tipo puro.
apenas_puros([]).
apenas_puros([H|T]) :- eh_puro(H), apenas_puros(T).

% --- REGRA 19: Time Desequilibrado (usa findall via contar_vulneraveis) ---
% Um time é desequilibrado se MAIS DA METADE dos seus Pokémons são
% vulneráveis ao mesmo tipo inimigo.
time_desequilibrado(Time) :-
    length(Time, Total),
    Limite is Total // 2,
    vantagem(TipoAt, _),
    contar_vulneraveis(Time, TipoAt, N),
    N > Limite, !.

% --- REGRA 20: Substituição Sugerida ---
% Identifica um membro fraco do time contra certo inimigo e propõe troca.
substituir(Time, Fraco, Inimigo, Novo) :-
    member(Fraco, Time),
    vulneravel(Fraco, Inimigo),
    sugerir_ajuda(Time, Inimigo, Novo).

% --- REGRA 21: Time Completo ---
time_completo(Time) :- length(Time, 6).

% --- REGRA 22: Vitória Total ---
% O atacante é super eficaz e o defensor não consegue contra-atacar.
vitoria_total(At, Def) :- super_eficaz(At, Def), \+ vence_duelo(Def, At).

% --- REGRA 23: Time Diverso (usa findall via tipos_do_time) ---
% Um time é diverso se possui ao menos 3 tipos diferentes entre seus membros.
time_diverso(Time) :-
    tipos_do_time(Time, Tipos),
    length(Tipos, N), N >= 3.

% --- REGRA 24: Pokémon de Elite ---
% Usa corte após verificar lendário para evitar dupla verificação.
elite(P) :- eh_lendario(P), !.
elite(P) :- tem_tipo_duplo(P).

% --- REGRA 25: Diagnóstico Final do Time ---
% Usa corte para não avaliar 'Equilibrado' quando já for 'Perigoso'.
diagnostico(Time, 'Perigoso')   :- time_desequilibrado(Time), !.
diagnostico(_, 'Equilibrado').

% --- REGRA 26: Contar Vulneráveis no Time (findall) ---
% Usa findall para reunir todos os membros vulneráveis a um tipo e contar.
contar_vulneraveis(Time, Tipo, N) :-
    findall(P, (member(P, Time), vulneravel(P, Tipo)), Lista),
    length(Lista, N).

% --- REGRA 27: Tipos Presentes no Time (findall + sort) ---
% Coleta todos os tipos primários e secundários do time e elimina duplicatas.
tipos_do_time(Time, TiposUnicos) :-
    findall(T,
        (member(P, Time),
         (pokemon(P, T, _) ; (pokemon(P, _, T), T \= nenhum))),
        Lista),
    sort(Lista, TiposUnicos).

% --- REGRA 28: Melhor Counter para um Pokémon ---
% Prioriza vitória total; se não existir, recorre a counter seguro.
% Usa corte para retornar somente o melhor resultado encontrado.
melhor_counter(Inimigo, Counter) :-
    vitoria_total(Counter, Inimigo), !.
melhor_counter(Inimigo, Counter) :-
    counter_seguro(Inimigo, Counter).