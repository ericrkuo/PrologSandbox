:- discontiguous playsAirGuitar/1, happy/1, listens2Music/1, woman/1.

/*
KB1

- a knowledge base if a collection of facts (KB1 has 5 facts), used to state things are unconditionally true
- mia, jody, yolanda are atoms
- woman, playsAirGuitar are predicates (functors with an arity)
- woman(yolanda) is a complex term (structur)

- Queries
?- woman(mia) - asking if Mia is a woman
?- woman(asdasd) - false since it is not a fact in KB1
?- man(mia) - false since Prolog has no information about the predicate
*/
woman(mia).
woman(jody).
woman(yolanda).
playsAirGuitar(jody).
party.

/*
KB2

Rule
- head :- body
- if KB contains a rule, and Prolog knows body follows from KB, then Prolog will infer haed
*/
happy(yolanda).
listens2Music(mia).
listens2Music(yolanda):-  happy(yolanda).
playsAirGuitar(mia):-  listens2Music(mia).
playsAirGuitar(yolanda):-  listens2Music(yolanda).

/*
KB3

- can have rules with more than one items in the body 
*/
happy(vincent).
listens2Music(butch).
playsAirGuitar(vincent):- listens2Music(vincent), happy(vincent).
playsAirGuitar(butch):- happy(butch).
playsAirGuitar(butch):- listens2Music(butch).
% OR can use disjunction playsAirGuitar(butch) :- happy(butch); listesns2Music(butch).

/*
KB4

- queries using variables
?- woman(X).
?- loves(X, mia).
?- loves(X,Y)
*/
woman(mia).
woman(jody).
woman(yolanda).

loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

/*
KB5

- using variables in program
- this is defining a concept about jealousy
*/
loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

jealous(X,Y):-  loves(X,Z),  loves(Y,Z).

/*
Nested Complex terms (recursive structure)
- two arguments (arity = 2)
- one is a variable
- the other is a complex term father(father(father(butch)))
*/
hide(X,father(father(father(butch)))).

% Predicates need to be identified by functor and number of arguments (arity)
loves(X,Y,Z). % loves/3
loves(W,X,Y,Z). % loves/4

/*
Soundness vs completeness
- Prolog's proof procedure is sound because if Prolog can prove/derive a body g (conjunction of atoms), then we know
g is a logical consequence of the KB such that g is true in every sensible interpretation of the KB

- Prolog's proof procedure is not complete. Example below: we know that a is a logical consequence of the KB because
in every model of the KB, a is true. However, Prolog will not be able to prove/derive a since it's proof procedure is top to bottom,
will start with
    - yes :- a.
    - yes :- a. (using the rule a :- a)
    - yes :- a. (using the rule a :- a again)
    - etc. Infinitely recurse and will not be able to prove
*/
a :- a.
a :- b.
b.