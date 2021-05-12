parse_string(Input, Output) :-
    tokenize_atom(Input, Output).

list_sentences(Input, Delimiter, Output) :-
    list_sentences_r(Input, Delimiter, Output2),
    findall(X, (member(X, Output2), length(X, Length), Length > 1), Output).

list_sentences_r([], _, [[]]).
list_sentences_r([D|T1], D, [[]|T2]) :-
    list_sentences_r(T1, D, T2).
list_sentences_r([H|T1], D, [[H|T2]|T3]) :-
    dif(H, D),
    list_sentences_r(T1, D, [T2|T3]).

