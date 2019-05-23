/* 
created by Taylor Mallory
for CS381 Programming Language Fundamentals

Chapters 1 and 2
*/

/*
1.1 atom, variable, or neither?

vINCENT - atom 
Footmassage - variable
variable23 - atom
Variable2000 - variable
big_kahuna_burger - atom
’big  kahuna  burger’ - atom
big  kahuna  burger - 3 seperate atoms? that or neither
’Jules’ - atom
_Jules - variable
’_Jules’ - atom

*/

/*
1.2 Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all? Give the functor and arity of each complex term.

loves(Vincent,mia) - complex term, functor: loves, arity: /2
’loves(Vincent,mia)’ - atom
Butch(boxer) - variable
boxer(Butch) - complex term, functor: boxer, arity: /1
and(big(burger),kahuna(burger)) - complex term, functors: and, big, kahuna, arity /2, /1 and /1
and(big(X),kahuna(X)) - complex term, functors: and, big, kahuna, arity /2, /1 and /1
_and(big(X),kahuna(X)) - variable
(Butch  kills  Vincent) - not a term
kills(Butch  Vincent) - complex term, functor: kills, arity: /1
kills(Butch,Vincent - not a term

*/

/*
Exercise  1.3 How many facts, rules, clauses, and predicates are there in the following knowledge base? What are the heads of the rules, and what are the goals they contain?

   woman(vincent).  
   woman(mia).  
   man(jules).  
   person(X):-  man(X);  woman(X).  
   loves(X,Y):-  father(X,Y).  
   father(Y,Z):-  man(Y),  son(Z,Y).  
   father(Y,Z):-  man(Y),  daughter(Z,Y). 

   -3 facts, 4 rules, 7 clauses, 5 predicates

*/

/*
Exercise  1.4 Represent the following in Prolog:

Butch is a killer. - killer(Butch).
Mia and Marsellus are married. - married(Mia, Marsellus).
Zed is dead. - dead(Zed).
Marsellus kills everyone who gives Mia a footmassage. - kills(footMassage(Mia, X)).
Mia loves everyone who is a good dancer. - loves(Mia, goodDancer(X)).
Jules eats anything that is nutritious or tasty. - 
    eats(Jules):- 
        nutritious(X);
        tasty(Y).

*/

/*
Exercise  1.5 Suppose we are working with the following knowledge base:

   wizard(ron). 
   hasWand(harry). 
   quidditchPlayer(harry). 
   wizard(X):-  hasBroom(X),  hasWand(X). 
   hasBroom(X):-  quidditchPlayer(X).
How does Prolog respond to the following queries?

wizard(ron). - true 
witch(ron). - undefined witch
wizard(hermione). - false
witch(hermione). - undefined witch
wizard(harry). - true
wizard(Y).  - ron
witch(Y).  - undefined witch

 */
