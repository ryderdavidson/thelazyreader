get_summary_r([], [], _Count, _Weights, _Sentences, _Output).
get_summary_r([WH|WT],[SH|ST], Weights, Sentences, Count, Output):-
  (Count < 4, max_member(WH, Weights)) -> (
      C is Count + 1,
      selectchk(WH, Weights, NW),
      selectchk(SH, Sentences, NS),
      append(A,[SH], Output),
      get_summary_r(NW, NS, NW, NS, C, A)
    );get_summary_r(WT, ST, Weights, Sentences, Count, Output).

get_summary(Weights, Sentences, Summary):-
  get_summary_r(Weights, Sentences, Weights, Sentences, 0, Summary).