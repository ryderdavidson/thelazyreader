:- ensure_loaded(parser).

get_summary(Text, Summary) :-
    handle_all_sentences(Text, Summary).
    
handle_all_sentences([], OutputWeights). % utility handles list of list
handle_all_sentences([List1|T], OutputWeights) :-
    lookupList(List1,TokenizedListofGloss),
    handle_all_Gloss(TokenizedListofGloss, StringGloss),
    handle_all_Intersection(StringGloss, List1, IntersectionList),
    weight(IntersectionList, CurrentWeight),
    handle_all_sentences(T, OutputWeights1),
    add_head(OutputWeights1, CurrentWeight, OutputWeights).

handle_all_Gloss([], Output). % utility handles list of list
handle_all_Gloss([List1|T], Output) :-
    atom_to_String(List1, Stringed),
    handle_all_Gloss(T, Output1),
    add_head(Output1, Stringed, Output).

atom_to_String([], Output).
atom_to_String([Head|Tail], Output) :-
    atom_string(Head, Stringed),
    atom_to_String(Tail, Output1),
    add_head(Output1, Stringed, Output).

lookupList([],ListOfGloss).
lookupList([X|T],ListOfGloss) :-
    string_to_atom(X,Atomized),
	(wordnet:s(Y,_A,Atomized,_B,_C,_D) ; errorHandler(Atomized, WordNotFound)),
    (wordnet:g(Y,Z) ; errorHandler(WordNotFound, Z)),
 	lookupList(T,ListOfGloss1),
    tokenize_atom(Z, TokenizedListofGloss),
    add_head(ListOfGloss1,TokenizedListofGloss,ListOfGloss).  

errorHandler(WordNotFound, DummyOutput) :- 
    DummyOutput = WordNotFound.

add_head([],X,[X]).
add_head(List, Item, [Item|List]).

%comparison utility we can use an intersection function intersection(l1,l2,l3) --> l3 is the intersection of l1 and l2
list_member(X,[X|_]).
list_member(X,[_|T]) :- list_member(X,T).

intersection([X|Y],Z,[X|W]) :-
   list_member(X,Z), intersection(Y,Z,W).
intersection([X|Y],Z,W) :-
   \+ list_member(X,Z), intersection(Y,Z,W).
intersection([],Z,[]).

handle_all_Intersection([], X, Output). % utility handles list of list
handle_all_Intersection([List1|T], X, Output) :-
    intersection(List1,X, SolvedIntersection),
    handle_all_Intersection(T, X, Output1),
    add_head(Output1, SolvedIntersection, Output).

%weight utility
weight([], SentenceWeight):-
    SentenceWeight is 0.
weight([X|Y], SentenceWeight):-
    weight(Y, L),
    SentenceWeight is L + 1.    
