%Taylor Mallory

/*
 5.1 How does Prolog respond to the following queries?

 1.  X = 3 * 4. - X = 3 * 4.
 2.  X is 3 * 4. - X = 12.
 3.  4 is X. - Arguments aren't sufficiently instantiated
 4.  X = Y. - X = Y.
 5.  3 is 1 + 2. - true.
 6.  3 is +(1, 2). - true.
 7.  3 is X + 2. - Arguments aren't sufficiently instantiated
 8.  X is 1 + 2. - X = 3.
 9.  1 + 2 is 1 + 2. - false.
 10. is(X, +(1, 2)). - X = 3.
 11. 3 + 2 = +(3, 2). - true.
 12. *(7, 5) = 7 * 5. - true.
 13. *(7, +(3, 2)) = 7 * (3 + 2). - true.
 14. *(7, (3 + 2)) = 7 * (3 + 2). - true.
 15. 7 * 3 + 2 = *(7, +(3, 2)). - false.
 16. *(7, (3 + 2)) = 7 * (+(3, 2)). - true.

5.2

1. Define a 2-place predicate increment that holds only when its second argument is an integer one larger than its first argument. For example, increment(4,5) should hold, but increment(4,6) should not.
2. Define a 3-place predicate sum that holds only when its third argument is the sum of the first two arguments. For example, sum(4,5,9) should hold, but sum(4,6,12) should not.

*/

increment(A, B) :- 
    B is A + 1.

sum(A, B, C) :- 
    C is A + B.

/*
5.3 Write a predicate addone/2 whose first argument is a list of integers, and whose second argument is the list of integers obtained by adding 1 to each integer in the first list. For example, the query
*/

addOne([], []).
addOne([A|B], [Ap|Bp]) :-
    Ap is A + 1,
    addone(B, Bp).

/*
In the text we discussed the 3-place predicate accMax which returned the maximum of a list of integers. By changing the code slightly, turn this into a 3-place predicate accMin which returns the minimum of a list of integers.
In mathematics, an n-dimensional vector is a list of numbers of length n. For example, [2,5,12] is a 3-dimensional vector, and [45,27,3,-4,6] is a 5-dimensional vector. One of the basic operations on vectors is scalar multiplication . In this operation, every element of a vector is multiplied by some number. For example, if we scalar multiply the 3-dimensional vector [2,7,4] by 3 the result is the 3-dimensional vector [6,21,12] .
Write a 3-place predicate scalarMult whose first argument is an integer, whose second argument is a list of integers, and whose third argument is the result of scalar multiplying the second argument by the first. For example, the query

   ?-  scalarMult(3,[2,7,4],Result).
should yield

   Result  =  [6,21,12]
Another fundamental operation on vectors is the dot product . This operation combines two vectors of the same dimension and yields a number as a result. The operation is carried out as follows: the corresponding elements of the two vectors are multiplied, and the results added. For example, the dot product of [2,5,6] and [3,4,1] is 6+20+6 , that is, 32 . Write a 3-place predicate dot whose first argument is a list of integers, whose second argument is a list of integers of the same length as the first, and whose third argument is the dot product of the first argument with the second. For example, the query
   ?-  dot([2,5,6],[3,4,1],Result).
should yield

   Result  =  32
*/

min([H|T], A, B) :-
    H < A,
    min(T, H, B).
min([H|T], A, B) :-
    H >= A,
    min(T, A, B).
min([], B, B).
min([H|T], B) :-
    min(T, H, B).


scalarMult(_, [], []).
scalarMult(X, [H|T], [Hn|B]) :-
    Hn is H * X,
    scalarMult(X, T, B).

dot([], [], 0).
dot([A|As], [B|Bs], C) :-
    dot(As, Bs, D),
    C is D + A * B.

/*

6.1 Let’s call a list doubled if it is made of two consecutive blocks of elements that are exactly the same. For example, [a,b,c,a,b,c] is doubled (it’s made up of [a,b,c] followed by [a,b,c] ) and so is [foo,gubble,foo,gubble] . On the other hand, [foo,gubble,foo] is not doubled. Write a predicate doubled(List) which succeeds when List is a doubled list.

*/

%this one kind of lost me


/*

A palindrome is a word or phrase that spells the same forwards and backwards. For example, ‘rotator’, ‘eve’, and ‘nurses run’ are all palindromes. Write a predicate palindrome(List) , which checks whether List is a palindrome. For example, to the queries

*/

palindrome(A) :- reverse(A, A).

/*

6.3 Write a predicate toptail(InList,OutList) which says no if InList is a list containing fewer than 2 elements, and which deletes the first and the last elements of InList and returns the result as OutList , when InList is a list containing at least 2 elements. For example:

           toptail([a],T). 
           no 
    
           toptail([a,b],T). 
           T=[] 
    
           toptail([a,b,c],T). 
           T=[b]
(Hint: here’s where append/3 comes in useful.)

*/

toptail([_|T],C) :- append(C,[_],T).

/*

6.4 Write a predicate last(List,X) which is true only when List is a list that contains at least one element and X is the last element of that list. Do this in two different ways:

Define last/2 using the predicate rev/2 discussed in the text.
Define last/2 using recursion.

*/

lastRev(L, X) :- reverse(L, [X|_]).


lastRec([X], X).
lastRec([_|T], X) :- last_rec(T, X).

/*

6.5 Write a predicate swapfl(List1,List2) which checks whether List1 is identical to List2 , except that the first and last elements are exchanged. Here’s where append/3 could come in useful again, but it is also possible to write a recursive definition without appealing to append/3 (or any other) predicates.

*/

swapfl([A|As], [B|Bs]) :-
    reverse(As, [B|X]),
    reverse(Bs, [A|X]).

/*

6.6 Here is an exercise for those of you who like logic puzzles.

There is a street with three neighbouring houses that all have a different colour, namely red, blue, and green. People of different nationalities live in the different houses and they all have a different pet. Here are some more facts about them:

The Englishman lives in the red house.
The jaguar is the pet of the Spanish family.
The Japanese lives to the right of the snail keeper.
The snail keeper lives to the left of the blue house.
Who keeps the zebra? Don’t work it out for yourself: define a predicate zebra/1 that tells you the nationality of the owner of the zebra!

(Hint: Think of a representation for the houses and the street. Code the four constraints in Prolog. You may find member/2 and sublist/2 useful.)

*/

%TODO

/*
We ‘flatten’ a list by removing all the square brackets around any lists it contains as elements, and around any lists that its elements contain as elements, and so on, for all nested lists. For example, when we flatten the list
   [a,b,[c,d],[[1,2]],foo]
we get the list

   [a,b,c,d,1,2,foo]
and when we flatten the list

   [a,b,[[[[[[[c,d]]]]]]],[[1,2]],foo,[]]
we also get

   [a,b,c,d,1,2,foo].
Write a predicate flatten(List,Flat) that holds when the first argument List flattens to the second argument Flat . This should be done without making use of append/3 .

Ok, we’re now halfway through the book. And flattening a list is the Pons Asinorum of Prolog programming. Did you cross it ok? If so, great. Time to move on.
*/

%TODO
