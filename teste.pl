pokemon(pidgey, normal, voador).
pokemon(rattata, normal, nenhum).
pokemon(snorlax, normal, nenhum).
vantagem(lutador, normal).

time_vulneravel([], _).
time_vulneravel([H|T], Tipo) :-
    vulneravel(H, Tipo),
    time_vulneravel(T, Tipo).

vulneravel(Pokemon, TipoAtacante) :-
    pokemon(Pokemon, T1, T2),
    (vantagem(TipoAtacante, T1) ; vantagem(TipoAtacante, T2)),
    !.

sugerir_ajuda(Time, TipoInimigo, Sugestao) :-
    vantagem(TipoSugestao, TipoInimigo),
    pokemon(Sugestao, TipoSugestao, _),
    \+ member(Sugestao, Time),
    !.