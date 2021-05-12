lookupList([],F,OriginalSentence) :- 
    write(F),
    intersection(F, OriginalSentence, Overlap),
    weight(Overlap, SentenceWeight), % list F at final run of lookUp list holds every gloss for each word in a list --> run the parse utility again on this list
    write(SentenceWeight).

lookupList([X|T],F,OriginalSentence) :-
	wordnet:s(Y,_A,X,_B,_C,_D), wordnet:g(Y,Z),
 	add_tail(F,Z,E),
 	lookupList(T,E,OriginalSentence). 

handle_all_sentences([]). % utility handles list of list
handle_all_sentences([X|T]) :-
    lookupList(X,F,X),
    handle_all_sentences(T).

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]) :- add_tail(T,X,L).

%comparison utility we can use an intersection function intersection(l1,l2,l3) --> l3 is the intersection of l1 and l2
list_member(X,[X|_]).
list_member(X,[_|T]) :- list_member(X,T).

intersection([X|Y],Z,[X|W]) :-
   list_member(X,Z), intersection(Y,Z,W).
intersection([X|Y],Z,W) :-
   \+ list_member(X,Z), intersection(Y,Z,W).
intersection([],Z,[]).

%weight utility
weight([], SentenceWeight):-
    SentenceWeight is 0.
weight([X|Y], SentenceWeight):-
    weight(Y, L),
    SentenceWeight is L + 1.
