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


