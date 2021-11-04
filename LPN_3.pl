% http://www.let.rug.nl/bos/lpn/lpnpage.php?pagetype=html&pageid=lpn-htmlch3

% 3.1 Recurisve definitions

is_digesting(X,Y)  :-  just_ate(X,Y).
% recursive because functor occurs in both head and body, therefore defined in terms of itself
is_digesting(X,Y)  :-
                just_ate(X,Z),
                is_digesting(Z,Y).

just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).

child(bridget,caroline).
child(caroline,donna).
child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

% WRONG b/c limited to two descendants or less%
% descend(X,Y)  :-  child(X,Y).
% descend(X,Y)  :-  child(X,Z), child(Z,Y).

%    ?-  descend(bridget,emily).
%    ?-  descend(anne,donna).
descend(X,Y) :- child(X,Y).
descend(X,Y) :- child(X,Z), descend(Z,Y).

% ?- numeral(succ(succ(succ(0)))). gives true
% ?- numeral(X).
numeral(0).
numeral(succ(X))  :-  numeral(X).

% add(0,0,0).
% add(0, succ(Y), succ(Z)) :- add(0, Y, Z).
% add(succ(X), 0, succ(Z)) :- add(X, 0, Z).
% add(succ(X), succ(Y), succ(succ(Z))) :- add(X,Y,Z).

add(0,Y,Y).
add(succ(X),Y,succ(Z))  :-
                add(X,Y,Z).

% 3.2

% swapper order of rules
% changing order of rules does not change behaviour, only order to which solutions are found
descend_1(X,Y)  :-  child(X,Z), descend_1(Z,Y).
descend_1(X,Y)  :-  child(X,Y).

% swap order of goals
% infinitely recurse - left recursive rule (leftmost item of body is identical to head)
descend_2(X,Y)  :-  descend_2(Z,Y), child(X,Z).
descend_2(X,Y)  :-  child(X,Y).