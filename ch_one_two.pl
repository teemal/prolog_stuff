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

/*

Exercise  2.1 Which of the following pairs of terms unify? Where relevant, give the variable instantiations that lead to successful unification.

bread  =  bread  - true
’Bread’  =  bread - false
’bread’  =  bread - true
Bread  =  bread - true Bread = bread.
bread  =  sausage - false
food(bread)  =  bread - false
food(bread)  =  X - true X = food(bread).
food(X)  =  food(bread) - true X = bread.
food(bread,X)  =  food(Y,sausage) - true X = sausage, Y = bread.
food(bread,X,beer)  =  food(Y,sausage,X) - false
food(bread,X,beer)  =  food(Y,kahuna_burger) - false
food(X)  =  X - true X = food(X).
meal(food(bread),drink(beer))  =  meal(X,Y) - true X = food(bread), Y = drink(beer).
meal(food(bread),X)  =  meal(X,drink(beer)) - false

*/

/*
Exercise  2.2 We are working with the following knowledge base:
*/
/*
   house_elf(dobby). 
   witch(hermione). 
   witch(’McGonagall’).  %this throws an error
   witch(rita_skeeter). 
   magic(X):-  house_elf(X). 
   magic(X):-  wizard(X). 
   magic(X):-  witch(X).
*/
/*
Which of the following queries are satisfied? Where relevant, give all the variable instantiations that lead to success.

?-  magic(house_elf). - every one of these throws an error like this "Undefined procedure: wizard/1"
?-  wizard(harry).
?-  magic(wizard).
?-  magic(’McGonagall’).
?-  magic(Hermione).

Draw the search tree for the query magic(Hermione) 

.....um....I can't?

*/

/*

Exercise  2.3 Here is a tiny lexicon (that is, information about individual words) and a mini grammar consisting of one syntactic rule (which defines a sentence to be an entity consisting of five words in the following order: a determiner, a noun, a verb, a determiner, a noun).

*/
/*
   word(determiner,a). 
   word(determiner,every). 
   word(noun,criminal). 
   word(noun,’big  kahuna  burger’). %this line throws an error
   word(verb,eats). 
   word(verb,likes). 

   sentence(Word1,Word2,Word3,Word4,Word5):- 
         word(determiner,Word1),  - throws an error so not entirely sure what to do
         word(noun,Word2), 
         word(verb,Word3), 
         word(determiner,Word4), 
         word(noun,Word5).
What query do you have to pose in order to find out which sentences the grammar can generate? List all sentences that this grammar can generate in the order that Prolog will generate them in.
*/
/*
Exercise  2.4 Here are six Italian words:

astante , astoria , baratto , cobalto , pistola , statale .

They are to be arranged, crossword puzzle fashion, in the following grid:


The following knowledge base represents a lexicon containing these words:

   word(astante,  a,s,t,a,n,t,e). 
   word(astoria,  a,s,t,o,r,i,a). 
   word(baratto,  b,a,r,a,t,t,o). 
   word(cobalto,  c,o,b,a,l,t,o). 
   word(pistola,  p,i,s,t,o,l,a). 
   word(statale,  s,t,a,t,a,l,e).
Write a predicate crossword/6 that tells us how to fill in the grid. The first three arguments should be the vertical words from left to right, and the last three arguments the horizontal words from top to bottom.

*/