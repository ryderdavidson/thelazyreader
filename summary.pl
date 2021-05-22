get_top_sentence([], [], Weights, Sentences, NW, NS, Sentence).
get_top_sentence([WH|WT], [SH|ST], Weights, Sentences, NW, NS, Sentence):-
  max_member(WH, Weights) ->
    selectchk(WH, Weights, NW),
    selectchk(SH, Sentences, NS),
    Sentence = SH; get_top_sentence(WT, ST, Weights, Sentences, NW, NS, Sentence).

get_summary(Weights, SText, TopList):-
  split_string(SText, ".", " ", SList),
  get_top_sentence(Weights, SList, Weights, SList, NW1, NS1, A),
  get_top_sentence(NW1, NS1, NW1, NS1, NW2, NS2, B),
  get_top_sentence(NW2, NS2, NW2, NS2, NW3, NS3, C),
  get_top_sentence(NW3, NS3, NW3, NS3, NW4, NS4, D),
  TopList = [A,B,C,D].