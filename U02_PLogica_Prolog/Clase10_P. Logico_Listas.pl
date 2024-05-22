
% Prolog

% Pertenece un elemento a una lista
% Meta Primaria: pertenece(Elemento, Lista)

%pertenece(1, [1]). -> true OK
%pertenece(1, [2]). -> false OK
%pertenece(1, []). -> false OK

%pertenece(1, [1,2]). -> OK
%pertenece(1, [2,1]).

%pertenece(Elemento, [Elemento | _]).

% [1,2] -> Resto: [2]
% [1,2] -> [Elemento | _]
% [2] -> [2, []]
% asi es como se recorre una lista -> FOR
pertenece(Elemento, [Elemento|_]).
    
pertenece(Elemento, [_ |Resto ]) :-
	pertenece(Elemento, Resto).

estacion(Nombre, Tiempo, [Nombre, Tiempo]).

getTiempo(Estacion, TiempoDelFuturo) :-
	estacion(_, Tiempo, Estacion),
    TiempoDelFuturo is Tiempo + 10.

% posible MAP
%map(Elemento, [Elemento|_], NuevoElemento) :-
%    NuevoElemento is Elemento + 500.

%map(Elemento, [_ |Resto ], NuevoElemento) :-
%	map(Elemento, Resto).

%maplist


%pertenece(Elemento, [Elemento|_]) :- !. % ! es cut


% pertenece([1,2,3], [["hola","chao"], [1,2,3]]).
% E1 = ["estacion1", 10],
%E2 = ["estacion2", 20],
%E3 = ["estacion3", 10],
%E4 = ["estacion4", 20],
%Seccion1 = [E1,E2],
%Seccion2 = [E3,E4],
%Linea1 = [Seccion1, Seccion2],
%append([Seccion1, Seccion2], ListaEstaciones),
%pertenece(E1, ListaEstaciones).

%E1 = ["estacion1", 10],
%E2 = ["estacion2", 20],
%E3 = ["estacion3", 10],
%E4 = ["estacion4", 20],
%E5 = ["estacion1", 10000],
%Seccion1 = [E1,E2,4,5,6,7],
%Seccion2 = [E3,E4],
%Linea1 = [Seccion1, Seccion2],
%append([Seccion1, Seccion2], ListaEstaciones),
%pertenece(E5, ListaEstaciones).

