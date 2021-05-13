:- ensure_loaded(parser).
:- ensure_loaded(look_up_list).
testfunction(X) :-
    parse_string_NoSentence(X, Y),
    write(X),
    write(Y).