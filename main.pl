:-use_module(tree).
:-use_module(arcsin).

run:-
	repeat,
	mainMenu,
	readln(Input),	
	case(Input),
	!.

mainMenu:-
	nl,
	writeln('List one of the commands: '),
	nl,
	writeln('fam - work with family\`s data'),
	writeln('asin - find asin by recursion'),
	writeln('q - close the programm'),
	nl,
	writeln('>>').

famMenu:-
	nl,
	writeln('Actions: '),
	nl,
	writeln('bd - show person\'s birthday'),
	writeln('mr - show person\'s mother'),
	writeln('fr - show person\'s father'),
	writeln('pr - check if person is pensioner'),
	writeln('q - back to main menu'),
	nl,
	writeln('>>').

case([fam]):-
	repeat,
	famMenu,
	readln(Input),
	famCase(Input),
	!,
	fail.

case([asin]):-
	writeln('X: '),
	readln(InputX),
	[X|_] = InputX,
	writeln('N: '),	
	readln(InputN),
	[N|_] = InputN,	
	nl,	
	myasin(X,N),
	fail.

case([q]):-
	writeln('Thank you for using my Prolog programm ;)').

getPersonName(Name):-
	writeln('Enter person\'s name: '),
	readln(InputName),
	[Name|_] = InputName.
	nl.

famCase([bd]):-
	getPersonName(Name),
	showBirthday(Name),	
	fail.

famCase([mr]):-
	getPersonName(Name),
	showMother(Name),	
	fail.

famCase([fr]):-
	getPersonName(Name),
	showFather(Name),	
	fail.

famCase([pr]):-
	getPersonName(Name),
	checkIfPensioner(Name),
	fail.

famCase([q]):-
	writeln('Work with family is done').