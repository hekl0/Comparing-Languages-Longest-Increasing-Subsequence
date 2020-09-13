reverse_list(L, R) :- 
    reverse_list(L, [], R).

reverse_list([H], L, [H|L]) :- 
    !.

reverse_list([X|T], L, R) :- 
    reverse_list(T, [X|L], R).

find_max(X, Y, A):- 
    length(X, LX),
    length(Y, LY),
    (LX =< LY -> A = Y; A = X).

lis(X, Y):-
    find_lis(X, [], R),
    reverse_list(R, Y).

find_lis([], [], R):- 
    R = [].

find_lis([], [CH|CT], R):- 
    R = [CH|CT].

find_lis([H|T], [], R):-
    find_lis(T, [], X), 
    find_lis(T, [H], Y), 
    find_max(X, Y, L), 
    R = L.

find_lis([H|T], [CH|CT], R):- 
    H =< CH -> find_lis(T, [CH|CT], A), 
    R = A; 
    find_lis(T, [CH|CT], X), 
    find_lis(T, [H, CH|CT], Y),
    find_max(X, Y, A), 
    R = A.

write_list([]) :- 
	nl.

write_list([H|T]) :-
    format('~w ', [H]),
    write_list(T).

read_number(N) :-
	read(N),
	integer(N).

main :-
	read_number(N),
	N > 0,
	length(L, N),
	maplist(read_number, L),
	lis(L, ML),
	write_list(ML).