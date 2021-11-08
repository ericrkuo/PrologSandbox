% http://www.let.rug.nl/bos/lpn/lpnpage.php?pagetype=html&pageid=lpn-htmlch5


% Arithmetic examples	Prolog Notation
% 6 + 2 =  8	    8   is  6+2.
% 6 ∗ 2 =  12	    12  is  6*2.
% 6 − 2 =  4	    4   is  6-2.
% 6 − 8 = −2	    -2  is  6-8.
% 6 ÷ 2 =  3	    3   is  6/2.
% 7 ÷ 2 =  3	    3   is  7/2.
% 7 % 3 =  1        1   is  mod(7,2).

add_3_and_double(X,Y)  :-  Y  is  (X+3)*2.
complex(X,Y) :- A is X*5,  B is A + 100, C is B - 11, Y is C.
complex_bedmas(X,Y) :- Y is (X*5 + 100) - 11.

/*
X is +(3,2) is equivalent to X is 3 + 2.
     - Reason is that +,-,* are all functors
is(X,+(3,2))
 - is is also a functor, and forms a compound term
*/

% 5.3
% tail recurisive using accumulators
accLen([_|T],A,L)  :-    Anew  is  A+1,  accLen(T,Anew,L).
accLen([],A,A).
leng(List,Length)  :-  accLen(List,0,Length).

% 5.4
foo(X) :- X = 3, X+10 < 9 + 13.

% wrong because what if our list is [-2,-3], would say max is -1
% max(List, Max) :- maxAcc(List, -1, Max).

% ASSUME non empty list (actually guarantees non-empty list because will return false if we call with empty list since we unify List to [H|Rest])
max(List, Max) :- List = [H|Rest], maxAcc(Rest, H, Max).
% or alternativaley
max2([H|Rest], Max) :- maxAcc(Rest, H, Max).

maxAcc([], MaxSoFar, MaxSoFar).
maxAcc([Head|Tail], MaxSoFar, Max) :- Head > MaxSoFar, maxAcc(Tail, Head, Max).
maxAcc([Head|Tail], MaxSoFar, Max) :- Head =< MaxSoFar, maxAcc(Tail, MaxSoFar, Max).
