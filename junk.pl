authors('harry potter', 'jkrowling').
authors('harry potter fanfic', 'jkrowling').
authors('got','rrmartin').

musician_instrument('celine dion', voice).
musician_instrument('zac wild', guitar).
musician_instrument('eric clapton', guitar).
musician_instrument('neil pert', drums).

musician_genre('celine dion', bad).
musician_genre('zac wild', metal).
musician_genre('eric clapton', classic_rock).
musician_genre('neil pert', progressive_rock).

artists_paintings_and_style('van gogh', 'stary night', impressionism).
artists_paintings_and_style('monet', 'lilly pads', impressionism).

diff(red, blue).
diff(red, green).
diff(green, red).
diff(green, blue).
diff(blue, green).
diff(blue, red).

coloring(A, F, G, M, T):-
    diff(A,F),
    diff(A,G),
    diff(A,M),
    diff(A,T),
    diff(F,G),
    diff(G,T),
    diff(T,M).


female(flori).
female(jill).
female(nikita).
female(kristen).
male(tom).
male(rasheed).
male(taylor).
parent(flori,taylor). 
parent(tom,taylor).
parent(tom,nikita).
parent(taylor,kristen).
parent(taylor,jill).
parent(jill,rasheed).

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
    

firstCousin(X,Y) :-
    X \== Y,
    sibling(Z1,Z2),
    


