% http://www.let.rug.nl/bos/lpn/lpnpage.php?pagetype=html&pageid=lpn-htmlse45
:- discontiguous big_mac/1.
% 10.3

/*
Bad b/c order dependent and mutually dependent clauses
*/
% enjoys(vincent,X)  :-  big_kahuna_burger(X),!,fail. %cut-failure
% enjoys(vincent,X)  :-  burger(X).

/*
Negation as failure, neg(Goal) succeeds when Goal inside failes
*/
neg(Goal)  :-  Goal,!,fail.
neg(_).

% enjoys(vincent,X)  :-  burger(X), neg(big_kahuna_burger(X)).

% built-in operator
enjoys(vincent,X)  :-  burger(X), \+ big_kahuna_burger(X).

burger(X)  :-  big_mac(X).
burger(X)  :-  big_kahuna_burger(X).
burger(X)  :-  whopper(X).

big_mac(a).
big_kahuna_burger(b).
big_mac(c).
whopper(d).
