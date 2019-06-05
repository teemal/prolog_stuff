isMember(X, [X|_]).
isMember(X, [_|Tail]) :- 
    isMember(X,Tail).

isUnion([Head|Tail],Y,Z) :- 
    isMember(Head,Y), 
    isUnion(Tail,Y,Z).
isUnion([Head|Tail],Y,[X|Z]) :- 
    not(isMember(Head,Y)), 
    isUnion(Tail,Y,Z).
isUnion([],Y,Y).

