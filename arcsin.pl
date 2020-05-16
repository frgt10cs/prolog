:-module(arcsin,[myasin/2]).

myasin(X,0, X, X):-!.

myasin(X, N, R, S):-
	N_ is N-1,
	myasin(X,N_,R_,S_),
	R is R_*(2*N_+1)*X*X*(2*N-1)/(2*N*(2*N+1)),
	S is S_+R.

myasin(X, N):-
	abs(X)<1,	
	myasin(X,N,_,S),
	write('result is: '),
	write(S),
	write('\n'),
	write('default value is: '),
	asin(X,K),
	write(K),
	write('\n'),
	write('diff is: '),
	D is abs(K-S),
	write(D).