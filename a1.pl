% Reverse a list L and save it to R
reverse_list(L, R) :- reverse_list(L,[],R).
reverse_list([H],L,[H|L]) :- !.
reverse_list([X|T],L,R) :- reverse_list(T,[X|L],R).

lis(X, Y) :-
	% Produce all pairs (leng, increasing sequence) with find_lis and then aggregate to 
	% find max pair with max length and save the result to R
	aggregate(max(Leng, S), (find_lis(X, [], S), length(S, Leng)), max(_, R)),
	reverse_list(R, Y).
 
% Base case
find_lis([], X, X).
 
% Current element is H, and the rest is T
find_lis([H | T], X, R) :-
	% If current is empty, add H to be the first element
	(X = [], find_lis(T, [H], R));
	% If current isnt empty, check the last element H1, if H1 < H then add H to current
	(X = [H1 | _], H1 < H, find_lis(T, [H | X], R));
	% Else sKip element H
	find_lis(T, X, R).
