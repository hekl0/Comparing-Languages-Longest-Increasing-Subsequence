lis(In, Out) :-
	aggregate(max(Leng,Seq), (one_seq(In, [], Seq), length(Seq, Leng)), max(_, Res)),
	reverse(Res, Out).
 
one_seq([], Current, Current).
 
one_seq([H | T], Current, Final) :-
	(Current = [], one_seq(T, [H], Final));
	(Current = [H1 | _], H1 < H, one_seq(T, [H | Current], Final));
	one_seq(T, Current, Final).