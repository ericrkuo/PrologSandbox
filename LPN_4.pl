% http://www.let.rug.nl/bos/lpn/lpnpage.php?pagetype=html&pageid=lpn-htmlch4
% lists in prolog have two parts: head and tail
% ?- [Head|Tail] = [1,2,3,4].
% first two elements ?- [X, Y | W]  =  [[],  dead(z),  [2,  [b,  c]],  [],  Z].

% getParts(Head, Tail, List).
/*
getParts(1,[2,3], List).
getParts(X, Y, [1,2,3,4]).
getParts([1], [2,3], List).
*/
getParts([], [], []).
getParts(X, Y, [X|Y]).

getFourthElement([], false).
getFourthElement([_,_,_,Elem|_], Elem).

% NOTE [X] does NOT mean the same as [X|_]
% [X] means single element list, but we want [X|_] when N is equal to 0
getNthElement(0, [X|_], X).
getNthElement(N, [_|List], Elem) :- getNthElement(M, List, Elem), N is M+1.

% get tail of [2, [b, c]] which is [[b,c]]
/*
E.g. want [b,c] from [[], dead(z), [2, [b, c]], [], Z, [2, [b, c]]].
?- [_,_,[ _ | X] | _ ]  = [[], dead(z), [2, [b, c]], [], Z, [2, [b, c]]].
*/

member(X,[X|_]).
member(X,[_|T])  :-  member(X,T).

% 4.3 Recursing with lists
% define a2b([a,a,a,a],[b,b,b,b]). if first list is all a's and second list if same length of b's

a2b([],[]).
a2b([a|List1], [b|List2]) :- a2b(List1, List2).