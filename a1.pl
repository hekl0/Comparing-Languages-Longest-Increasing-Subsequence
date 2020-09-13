lis(In, Out) :-
	% Produce all pair (leng, increasing sequence) with one_seq and then aggregate to find max pair
	% and then save the result to res
	aggregate(max(Leng,Seq), (one_seq(In, [], Seq), length(Seq, Leng)), max(_, Res)),
	reverse(Res, Out).
 
% Base case
one_seq([], Current, Current).
 
% Recursive to produce increasing sequence and save the sequence to Final
one_seq([H | T], Current, Final) :-
	% If current is empty, add H to be the first element
	(Current = [], one_seq(T, [H], Final));
	% If current isnt empty, check the last element H1, if H1 < H then add H to current
	(Current = [H1 | _], H1 < H, one_seq(T, [H | Current], Final));
	% SKip element H
	one_seq(T, Current, Final).