% ==============================================================================
% 1. BASE DE FATOS (Mínimo de 50 atingido)
% ==============================================================================

% --- POKÉMONS ---
pokemon(pidgey, normal, voador).
pokemon(pidgeotto, normal, voador).
pokemon(pidgeot, normal, voador).
pokemon(rattata, normal, nenhum).
pokemon(raticate, normal, nenhum).
pokemon(spearow, normal, voador).
pokemon(fearow, normal, voador).
pokemon(jigglypuff, normal, nenhum).
pokemon(wigglytuff, normal, nenhum).
pokemon(meowth, normal, nenhum).
pokemon(persian, normal, nenhum).
pokemon(eevee, normal, nenhum).
pokemon(porygon, normal, nenhum).
pokemon(snorlax, normal, nenhum).
pokemon(charmander, fogo, nenhum).
pokemon(charmeleon, fogo, nenhum).
pokemon(charizard, fogo, voador).
pokemon(vulpix, fogo, nenhum).
pokemon(ninetales, fogo, nenhum).
pokemon(growlithe, fogo, nenhum).
pokemon(arcanine, fogo, nenhum).
pokemon(magmar, fogo, nenhum).
pokemon(flareon, fogo, nenhum).
pokemon(squirtle, agua, nenhum).
pokemon(wartortle, agua, nenhum).
pokemon(blastoise, agua, nenhum).
pokemon(psyduck, agua, nenhum).
pokemon(golduck, agua, nenhum).
pokemon(poliwag, agua, nenhum).
pokemon(tentacool, agua, veneno).
pokemon(vaporeon, agua, nenhum).
pokemon(lapras, agua, gelo).
pokemon(bulbasaur, grama, veneno).
pokemon(ivysaur, grama, veneno).
pokemon(venusaur, grama, veneno).
pokemon(oddish, grama, veneno).
pokemon(vileplume, grama, veneno).
pokemon(exeggutor, grama, psiquico).
pokemon(pikachu, eletrico, nenhum).
pokemon(raichu, eletrico, nenhum).
pokemon(magnemite, eletrico, nenhum).
pokemon(magneton, eletrico, nenhum).
pokemon(jolteon, eletrico, nenhum).
pokemon(geodude, pedra, terra).
pokemon(golem, pedra, terra).
pokemon(onix, pedra, terra).
pokemon(cubone, terra, nenhum).
pokemon(rhyhorn, terra, pedra).
pokemon(scyther, inseto, voador).
pokemon(pinsir, inseto, nenhum).
pokemon(alakazam, psiquico, nenhum).
pokemon(mewtwo, psiquico, nenhum).
pokemon(machamp, lutador, nenhum).
pokemon(gengar, fantasma, veneno).
pokemon(dragonite, dragao, voador).

% --- VANTAGENS ---
vantagem(fogo, grama).
vantagem(fogo, gelo).
vantagem(fogo, inseto).
vantagem(agua, fogo).
vantagem(agua, terra).
vantagem(agua, pedra).
vantagem(grama, agua).
vantagem(grama, terra).
vantagem(grama, pedra).
vantagem(eletrico, agua).
vantagem(eletrico, voador).
vantagem(gelo, grama).
vantagem(gelo, terra).
vantagem(gelo, voador).
vantagem(gelo, dragao).
vantagem(lutador, normal).
vantagem(lutador, gelo).
vantagem(lutador, pedra).
vantagem(veneno, grama).
vantagem(veneno, inseto).
vantagem(terra, fogo).
vantagem(terra, eletrico).
vantagem(terra, veneno).
vantagem(terra, pedra).
vantagem(voador, grama).
vantagem(voador, lutador).
vantagem(voador, inseto).
vantagem(psiquico, lutador).
vantagem(psiquico, veneno).
vantagem(inseto, grama).
vantagem(inseto, psiquico).
vantagem(inseto, veneno).
vantagem(pedra, fogo).
vantagem(pedra, gelo).
vantagem(pedra, voador).
vantagem(pedra, inseto).
vantagem(fantasma, psiquico).
vantagem(fantasma, fantasma).
vantagem(dragao, dragao).

% --- IMUNIDADES ---
imunidade(terra, eletrico).
imunidade(voador, terra).
imunidade(fantasma, normal).
imunidade(fantasma, lutador).
imunidade(normal, fantasma).
imunidade(psiquico, fantasma).

% ==============================================================================
% 2. BASE DE REGRAS (Mínimo de 25 atingido)
% ==============================================================================

% 1 e 2. Duelo (Usa Corte para eficiência)
vence_duelo(Atacante, Defensor) :-
    pokemon(Atacante, TipoA, _),
    pokemon(Defensor, TipoD, _),
    imunidade(TipoD, TipoA), !, fail.

vence_duelo(Atacante, Defensor) :-
    pokemon(Atacante, T1_A, T2_A),
    pokemon(Defensor, T1_D, T2_D),
    (vantagem(T1_A, T1_D) ; vantagem(T1_A, T2_D) ; vantagem(T2_A, T1_D) ; vantagem(T2_A, T2_D)), !.

% 3. Vulnerabilidade individual
vulneravel(Pokemon, TipoAtacante) :-
    pokemon(Pokemon, T1, T2),
    (vantagem(TipoAtacante, T1) ; vantagem(TipoAtacante, T2)), !.

% 4 e 5. Verificação de Time Vulnerável (Recursividade e Listas)[cite: 1]
time_vulneravel([], _).
time_vulneravel([H|T], TipoAtacante) :-
    vulneravel(H, TipoAtacante),
    time_vulneravel(T, TipoAtacante).

% 6. Sugestão de Ajuda
sugerir_ajuda(Time, TipoInimigo, Sugestao) :-
    vantagem(TipoSugestao, TipoInimigo),
    pokemon(Sugestao, TipoSugestao, _),
    \+ member(Sugestao, Time), !.

% 7. Verifica se o Pokémon é puro
eh_puro(P) :- pokemon(P, _, nenhum).

% 8. Verifica se dois pokémons compartilham o mesmo tipo
mesmo_tipo(P1, P2) :-
    pokemon(P1, T, _), pokemon(P2, T, _), P1 \= P2.

% 9. Pokémon lendário
eh_lendario(mewtwo).
eh_lendario(dragonite).

% 10. Sugerir por tipo
sugerir_por_tipo(Tipo, P) :- pokemon(P, Tipo, _); pokemon(P, _, Tipo).

% 11. Tipo Duplo
tem_tipo_duplo(P) :- pokemon(P, _, T2), T2 \= nenhum.

% 12. Resistente (Não apanha para o tipo)
resistente(P, TipoAtacante) :- \+ vulneravel(P, TipoAtacante).

% 13. Super Eficaz (Vantagem sobre os dois tipos do defensor)
super_eficaz(At, Def) :-
    pokemon(At, T1, _), pokemon(Def, D1, D2),
    vantagem(T1, D1), vantagem(T1, D2), D2 \= nenhum.

% 14. Cobertura de time
tem_cobertura(Time, TipoIn) :- member(P, Time), \+ vulneravel(P, TipoIn).

% 15. Time Temático (Todos do mesmo tipo)
time_tematico([], _).
time_tematico([H|T], Tipo) :-
    (pokemon(H, Tipo, _); pokemon(H, _, Tipo)), time_tematico(T, Tipo).

% 16. Counter Seguro (Vence e não apanha)
counter_seguro(Inimigo, Sugestao) :-
    vence_duelo(Sugestao, Inimigo), \+ vence_duelo(Inimigo, Sugestao), !.

% 17. Time com Lendário
tem_lendario(Time) :- member(P, Time), eh_lendario(P).

% 18. Apenas Puros (Lista/Recursão)[cite: 1]
apenas_puros([]).
apenas_puros([H|T]) :- eh_puro(H), apenas_puros(T).

% 19. Time Desequilibrado
time_desequilibrado(Time) :- vantagem(TipoAt, _), time_vulneravel(Time, TipoAt).

% 20. Sugerir substituição
substituir(Time, Fraco, Inimigo, Novo) :-
    member(Fraco, Time), vulneravel(Fraco, Inimigo), sugerir_ajuda(Time, Inimigo, Novo).

% 21. Time de 6
time_completo(Time) :- length(Time, 6).

% 22. Vitoria Total
vitoria_total(At, Def) :- super_eficaz(At, Def), \+ vence_duelo(Def, At).

% 23. Time Diverso (Possui mais de 1 tipo na lista)
time_diverso([H1, H2|_]) :- pokemon(H1, T1, _), pokemon(H2, T2, _), T1 \= T2.

% 24. Pokémon de Elite (Lendário ou Tipo Duplo)
elite(P) :- eh_lendario(P); tem_tipo_duplo(P).

% 25. Diagnóstico Final
diagnostico(Time, 'Perigoso') :- time_desequilibrado(Time), !.
diagnostico(_, 'Equilibrado').