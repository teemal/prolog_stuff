female(flori).
female(jill).
female(nikita).
female(kristen).
female(jenny).
female(marissa).
female(kayla).
male(tom).
male(rasheed).
male(taylor).
male(mike).
male(bryce).
male(jesse).
parent(flori,taylor). 
parent(tom,taylor).
parent(tom,nikita).
parent(taylor,kristen).
parent(taylor,jill).
parent(jill,rasheed).
parent(jill, kayla).
parent(jill, bryce).

mother(X,Y) :- 
    female(X),
    parent(X,Y).

father(X,Y) :-
    male(X),
    parent(X,Y).

sister(X,Y) :-
    X \== Y,
    female(X),
    parent(Z,X),
    parent(Z,Y).

grandson(X,Y) :-
    X \== Y,
    male(X),
    parent(Y,Z),
    parent(Z,X).

sibling(X,Y) :-
    parent(Z,X),
    parent(Z,Y).

offspring(X,Y) :- 
    male(X);
    female(X),
    parent(Y,X).

firstCousin(X,Y) :-
    X \== Y,
    sibling(Z1,Z2),
    offspring(Z1, X),
    offspring(Z2, Y).

descendant(X,Y) :- 
    parent(Y,X).
descendant(X,Y) :- 
    parent(Z,X), 
    descendant(Z,Y). 

third([_,_,C|_],C).

firstPair( [X, X | _]).

del3([A, B, _ | D], [A, B| D]).

dupList([],[]).
dupList([A|B], [A, A|C]) :- dupList(B, C).

isDuped([]).
isDuped([A,A|B]) :- 
    isDuped(B).

oddSize([_]).
oddSize([_|B]) :- 
    evenSize(B).

evenSize([]).
evenSize([_|B]) :- 
    oddSize(B).

/*q 14 -- no clue what the hell the author is asking for */

prefix(X,Y) :- append(X,_,Y).

isMember(A, [A|B]) :- 
    A = B, 
    isMember(A, B).