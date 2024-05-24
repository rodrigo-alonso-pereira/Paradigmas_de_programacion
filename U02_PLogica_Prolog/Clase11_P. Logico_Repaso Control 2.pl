% Lista = [1,2,3]

% Ej.
%  [Cabeza|Resto] = [1,2,3].
%s Cabeza = 1,
%s Resto = [2, 3]

% Ej.
% pertenece = member
%  member("Hola", [1,2,3,"Hola","holA",4,5,6]).
%s true

% Ej.
%  member(X, [1,2,3,"Hola","holA",4,5,6]),
%  string(X),
%  kX = "Hola".
%s X = "Hola"

% ! = cut = 

%pertenece(Elemento, [Elemento| _]) :- !.

pertenece(Elemento, [Elemento| _]).  % caso borde/caso base/IF

pertenece(Elemento, [_| Resto]) :-  % ELSE -> RECURSION
    pertenece(Elemento, Resto).

% Ej: Comparacion de un elemento en dos listas.
%  pertenece(Numero, [1,2]),
%  pertenece(Numero, [2,3]).
%s Numero = 2

% Ej,
%  pertenece(X, [1,2,3,"Hola","holA",4,5,6]),
%  number(X),
%  X > 5.
%s X = 6

% Agregar un elemento a una lista. AL PRINCIPIO
% agregar -> "hola", [1,2,3] -> en alguna parte de la lista, contenga el "hola"
%(cons "elemento" (list 1 2 3)) -> (list "elemento" 1 2 3)
% agregarAlInicio(Elemento, Lista) ->
% agregarAlInicio("hola", [1,2,3]) -> ["hola", 1, 2, 3]

% Meta Primaria (MP):
% ("hola", [1,2,3], ["hola", 1, 2, 3])
% (Elemento, Lista, [Elemento | Lista])
agregarAlInicio(Elemento, Lista, [Elemento | Lista]).

% Ej.
%  agregarAlInicio("Hola", [1,2,3], NewLista).
%s NewLista = ["Hola", 1, 2, 3]

% Largo
% largo([], 0)
% largo([1], 1)
% largo([1,2], 2)
% largo([9,8,7], 3)

largo([], 0).

largo([_|Resto], Largo) :-
    largo(Resto, Acc), % loop hasta llegar a caso base, obtengo valor Acc
    Largo is Acc + 1.  % operacion que se realiza con Acc para cada estado pendiente

% Ej,
%  largo([1,2,"Hola","Chao",3,4,5], Len).
%s Len = 7
/*
 * largo([1,2,"Hola","Chao",[3,4,5]], Len).
 	Debug:
	 Call:largo([2, "Hola", "Chao", [3, 4, 5]],_9990)
 	 Call:largo(["Hola", "Chao", [3, 4, 5]],_1422)
	 Call:largo(["Chao", [3, 4, 5]],_1424)
 	 Call:largo([[3, 4, 5]],_1426)
	 Call:largo([],_1428)
	 Exit:largo([],0)
 	 Call:_1406 is 0+1
	 Exit:1 is 0+1
	 Exit:largo([[3, 4, 5]],1)
	 Call:_1404 is 1+1
	 Exit:2 is 1+1
 	 Exit:largo(["Chao", [3, 4, 5]],2)
	 Call:_1402 is 2+1
	 Exit:3 is 2+1
	 Exit:largo(["Hola", "Chao", [3, 4, 5]],3)
	 Call:_1400 is 3+1
	 Exit:4 is 3+1
	 Exit:largo([2, "Hola", "Chao", [3, 4, 5]],4)
	 Call:_1172 is 4+1
	 Exit:5 is 4+1
	 Exit:largo([1, 2, "Hola", "Chao", [3, 4, 5]],5)
 * Len = 5
*/

% largo([], 0). L = 0
% largo(["hola"], L)   
%    ->  iteracion1: ["hola"], L
%    ->  iteracion2: [], 0
    
%    largo(["hola"], L) : se encuentra pendiente
%    	  largo([], 0) - > L = 0
%    				L + L+1
    
%largo([Elemento], 1).
%largo([Elemento1, Elemento2], 2).
%largo([Elemento1, Elemento2, Elemento3], 3). 

%largo(Lista, Largo).

%member(X, ["hola", "chao", 1, 2, 3]),
%string(X),
%X = "hola".

aplanar([], 0).

aplanar([Elemento|Resto], Valor) :-
    aplanar(Resto, Acc), % loop hasta llegar a caso base, obtengo valor Acc
    Valor is Acc + Elemento.  % operacion que se realiza con Acc para cada estado pendiente

