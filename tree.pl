:-module(tree, [showBirthday/1, showMother/1, showFather/1, checkIfPensioner/1]).

parent('Sergey','Ivan').
parent('Irina','Ivan').
parent('Irina','Olga').
parent('Galina','Sergey').
parent('Galina','Ludmila').
parent('Vladimir','Sergey').
parent('Vladimir','Ludmila').
parent('Olga','Sasha').
parent('Olga','Dmitry').

date_of_birth('Ivan',2,1,2000).
date_of_birth('Irina',5,8,1962).
date_of_birth('Sergey',24,1,1962).
date_of_birth('Olga',21,2,1970).
date_of_birth('Sasha',18,7,1998).
date_of_birth('Dmitry',3,2,2002).
date_of_birth('Galina',15,3,1920).

female('Irina').
female('Galina').
female('Olga').

male('Sergey').
male('Ivan').
male('Vladimir').

child(X,Y):-parent(X,Y).

showBirthday(Name):-
	date_of_birth(Name,D,M,Y),
	atom_concat(D,'.', Temp),
	atom_concat(Temp,M, Temp_),
	atom_concat(Temp_,'.', Temp__),
	atom_concat(Temp__,Y, Bd),
	writef('%w\'s birthday is: %w',[Name, Bd]),
	nl.	

mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).

showMother(Name):-
	mother(MotherName,Name),
	writef('%w\'s mother is: %w',[Name, MotherName]),
	nl.	

showFather(Name):-
	father(FatherName,Name),
	writef('%w\'s father is: %w',[Name, FatherName]),
	nl.

checkIfPensioner(Name):-
	date_of_birth(Name,_,_,Year),
	Year<1960,
	write('Pensioner').

checkIfPensioner(Name):-
	date_of_birth(Name,_,_,Year),
	Year>1960,
	write('Not pensioner').