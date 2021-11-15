% http://www.let.rug.nl/bos/lpn/lpnpage.php?pagetype=html&pageid=lpn-htmlch6

% 6.1 Append

my_append([],L,L).
my_append([H|T],L2,[H|L3])  :-  my_append(T,L2,L3).

:- begin_tests('my_append').

test('1', [nondet]) :-
     my_append([a,b,c],[1,2,3],[a,b,c,1,2,3]).

test('2', [nondet]) :-
     my_append([a,
          [foo,gibble],c],[1,2,[[],b]],
          [a,[foo,gibble],c,1,2,[[],b]]).

test('3', [fail]) :-
     my_append([a,b,c],[1,2,3],[a,b,c,1,2]).

test('3', [fail]) :-
     my_append([a,b,c],[1,2,3],[1,2,3,a,b,c]).

:- end_tests('my_append').

prefix(P,L):-  append(P,_,L).
suffix(S, L) :- append(_, S, L).
sublist(SubL,L):-  suffix(S,L),  prefix(SubL,S).

% 6.2 Reversing a List

rev_with_append([], []).
rev_with_append([H|T], R) :- rev_with_append(T, Temp), append(Temp, [H], R).


% with accumulator

rev(List, R) :- rev_acc(List, R, []).

% rev_acc(List, R, Acc).
rev_acc([], R, R).
rev_acc([H|T], R, Acc) :- rev_acc(T, R, [H|Acc]).