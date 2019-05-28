/* 
created by Taylor Mallory
for CS381 Programming Language Fundamentals

Chapters 3 and 4
*/

/*
Exercise  3.1 In the text, we discussed the predicate

   descend(X,Y)  :-  child(X,Y). 
   descend(X,Y)  :-  child(X,Z), 
                                     descend(Z,Y).
Suppose we reformulated this predicate as follows:

   descend(X,Y)  :-  child(X,Y). 
   descend(X,Y)  :-  descend(X,Z), 
                                     descend(Z,Y).
Would this be problematic?

yes, you'd run into an inifitely recursive call

*/

/*
3.2 Do you know these wooden Russian dolls (Matryoshka dolls) where the smaller ones are contained in bigger ones? Here is a schematic picture:

First, write a knowledge base using the predicate directlyIn/2 which encodes which doll is directly contained in which other doll. Then, define a recursive predicate in/2 , that tells us which doll is (directly or indirectly) contained in which other dolls. For example, the query in(katarina,natasha) should evaluate to true, while in(olga,  katarina) should fail.

*/

directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha,irina).

in(X, Y) :-
    directlyIn(X, Y).
in(X, Y) :-
    directlyIn(X, Z),
    in(Z, Y).

/*
3.3 We have the following knowledge base:
*/
   directTrain(saarbruecken,dudweiler). 
   directTrain(forbach,saarbruecken). 
   directTrain(freyming,forbach). 
   directTrain(stAvold,freyming). 
   directTrain(fahlquemont,stAvold). 
   directTrain(metz,fahlquemont). 
   directTrain(nancy,metz).

/*
That is, this knowledge base holds facts about towns it is possible to travel between by taking a direct train. But of course, we can travel further by chaining together direct train journeys. Write a recursive predicate travelFromTo/2 that tells us when we can travel by train between two towns. For example, when given the query

   travelFromTo(nancy,saarbruecken).
it should reply yes.
*/

travelFromTo(X, Y) :-
    directTrain(X, Y).
travelFromTo(X, Y) :-
    directTrain(X, Z),
    travelFromTo(Z, Y).

/*
3.4 Define a predicate greater_than/2 that takes two numerals in the notation that we introduced in the text (that is, 0, succ(0), succ(succ(0)), and so on) as arguments and decides whether the first one is greater than the second one. For example:

   ?-  greater_than(succ(succ(succ(0))),succ(0)). 
   yes 
   ?-  greater_than(succ(succ(0)),succ(succ(succ(0)))). 
   no
*/

greater_than(succ(_), 0).
greater_than(succ(X), succ(Y)) :-
    greater_than(X, Y).
/*
3.4 - 1
Write a predicate path/2 that tells you from which points in the maze you can get to which other points when chaining together connections given in the above knowledge base. Can you get from point 5 to point 10? Which other point can you get to when starting at point 1? And which points can be reached from point 13?
*/

   connected(1,2). 
   connected(3,4). 
   connected(5,6). 
   connected(7,8). 
   connected(9,10). 
   connected(12,13). 
   connected(13,14). 
   connected(15,16). 
   connected(17,18). 
   connected(19,20). 
   connected(4,1). 
   connected(6,3). 
   connected(4,7). 
   connected(6,11). 
   connected(14,9). 
   connected(11,15). 
   connected(16,12). 
   connected(14,17). 
   connected(16,19).

path(A, B) :-
    connected(A, B).
path(A, B) :-
    connected(A, Z),
    path(Z, B).

/* 
3.4 - 2
Write a predicate travel/2 which determines whether it is possible to travel from one place to another by chaining together car, train, and plane journeys. For example, your program should answer yes to the query travel(valmont,raglan) .
*/

   byCar(auckland,hamilton). 
   byCar(hamilton,raglan). 
   byCar(valmont,saarbruecken). 
   byCar(valmont,metz). 
    
   byTrain(metz,frankfurt). 
   byTrain(saarbruecken,frankfurt). 
   byTrain(metz,paris). 
   byTrain(saarbruecken,paris). 
    
   byPlane(frankfurt,bangkok). 
   byPlane(frankfurt,singapore). 
   byPlane(paris,losAngeles). 
   byPlane(bangkok,auckland). 
   byPlane(singapore,auckland). 
   byPlane(losAngeles,auckland).

goTo(A, B) :-
    byCar(A, B);
    byPlane(A, B);
    byTrain(A, B).
travel(A, B) :-
    goTo(A, B).
travel(A, B) :-
    goTo(A, X),
    travel(X, B).


/*

Exercise  4.1 How does Prolog respond to the following queries?

[a,b,c,d]  =  [a,[b,c,d]].  - false
[a,b,c,d]  =  [a|[b,c,d]]. - true
[a,b,c,d]  =  [a,b,[c,d]]. - false
[a,b,c,d]  =  [a,b|[c,d]]. - true
[a,b,c,d]  =  [a,b,c,[d]]. - false
[a,b,c,d]  =  [a,b,c|[d]]. - true
[a,b,c,d]  =  [a,b,c,d,[]]. - false
[a,b,c,d]  =  [a,b,c,d|[]]. - true
[]  =  _. - true
[]  =  [_]. - false
[]  =  [_|[]]. - alse

*/

/*

4.2 Which of the following are syntactically correct lists? If the representation is correct, how many elements does the list have?

[1|[2,3,4]] - correct 4
[1,2,3|[]] - correct 3
[1|2,3,4] - 
[1|[2|[3|[4]]]]  - correct 4
[1,2,3,4|[]] - correct 4
[[]|[]] - correct 1
[[1,2]|4] - 
[[1,2],[3,4]|[5,6,7]] - correct 7

*/

/*

4.3 Write a predicate second(X,List) which checks whether X is the second element of List .

*/

second(X, [_,X|_]).

/*

4.4 Write a predicate swap12(List1,List2) which checks whether List1 is identical to List2 , except that the first two elements are exchanged.

*/

swap12([X,Y|T], [Y,X|T]).

/*

4.5 Suppose we are given a knowledge base with the following facts:

*/

   tran(eins,one). 
   tran(zwei,two). 
   tran(drei,three). 
   tran(vier,four). 
   tran(fuenf,five). 
   tran(sechs,six). 
   tran(sieben,seven). 
   tran(acht,eight). 
   tran(neun,nine).

/*

Write a predicate listtran(G,E) which translates a list of German number words to the corresponding list of English number words. For example:

   listtran([eins,neun,zwei],X).
should give:

   X  =  [one,nine,two].
Your program should also work in the other direction. For example, if you give it the query

   listtran(X,[one,seven,six,two]).
it should return:

   X  =  [eins,sieben,sechs,zwei].
(Hint: to answer this question, first ask yourself “How do I translate the empty list of number words?”. That’s the base case. For non-empty lists, first translate the head of the list, then use recursion to translate the tail.)

*/

listtran([], []).
listtran([X|Xs], [Y|Ys]) :-
    tran(X, Y),
    listtran(Xs, Ys).

/*

Write a 3-place predicate combine1 which takes three lists as arguments and combines the elements of the first two lists into the third as follows:
   ?-  combine1([a,b,c],[1,2,3],X). 
    
   X  =  [a,1,b,2,c,3] 
    
   ?-  combine1([f,b,yip,yup],[glu,gla,gli,glo],Result). 
    
   Result  =  [f,glu,b,gla,yip,gli,yup,glo]

*/

combine1([], [], []).
combine1([X|Xs], [Y|Ys], [X,Y|Z]) :-
    combine1(Xs, Ys, Z).

/*

Now write a 3-place predicate combine2 which takes three lists as arguments and combines the elements of the first two lists into the third as follows:
   ?-  combine2([a,b,c],[1,2,3],X). 
    
   X  =  [[a,1],[b,2],[c,3]] 
    
   ?-  combine2([f,b,yip,yup],[glu,gla,gli,glo],Result). 
    
   Result  =  [[f,glu],[b,gla],[yip,gli],[yup,glo]]

*/

combine2([], [], []).
combine2([X|Xs], [Y|Ys], [[X,Y]|Z]) :-
    combine2(Xs, Ys, Z).

/*

Finally, write a 3-place predicate combine3 which takes three lists as arguments and combines the elements of the first two lists into the third as follows:
   ?-  combine3([a,b,c],[1,2,3],X). 
    
   X  =  [j(a,1),j(b,2),j(c,3)] 
    
   ?-  combine3([f,b,yip,yup],[glu,gla,gli,glo],R). 
    
   R  =  [j(f,glu),j(b,gla),j(yip,gli),j(yup,glo)]

*/

combine3([], [], []).
combine3([X|Xs], [Y|Ys], [j(X,Y)|Z]) :-
    combine3(Xs, Ys, Z).