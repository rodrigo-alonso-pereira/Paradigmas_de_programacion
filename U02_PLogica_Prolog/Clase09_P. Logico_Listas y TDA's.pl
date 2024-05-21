
banda(rolling_stones).

% TDA

% Constructor
% alumno/4
% Meta Primaria (MP): alumno/4
% Meta Secundaria (MS): 
%    string(Nombre).
alumno(Id, Nombre, Promedio, [Id, Nombre, Promedio]) :-
    string(Nombre),  %la coma , es el AND.  y ; es OR
    number(Id),
	Id >= 0.

% TDA CURSO

curso(Nombre, Alumnos, [Nombre, Alumnos]).

% Lab2:
linea(Nombre, Estaciones, [Nombre, Estaciones]).
% linea("L4", [E1,E2,E3], L4).

% alumno(1, "pepe", 3, A1),
% alumno(2, "pepo", 4, A2),
% alumno(3, "pepa", 5, A3),
% curso("paradigmas", [A1, A2, A3], C1).


% alumno(1, "pepe", 7, [1, "pepe", 7]).  LE ENSEÑASTE ESTO
% % alumno(Id, Name, 7, [1, "pepe", 7]).  LE ENSEÑASTE ESTO
% alumno(Id, Name, 3, [1, "pepe", 7]).  LE ENSEÑASTE ESTO

% Capas TDA (Capa GET)
alumno_get_id(Alumno, Id) :-
    alumno(Id, _, _, Alumno).
 
alumno_get_id_and_name(Alumno, Id, Name) :-
    alumno(Id, Name, _, Alumno).
 
% Capa Set
% alumno_set_promedio -> (1, "pepe", 4)
% alumno_set_promedio -> (1, "pepe", 7)
alumno_set_promedio(AlumnoIn, NewPromedio, AlumnoOut) :-
    alumno(Id, Name, _, AlumnoIn),
    alumno(Id, Name, NewPromedio, AlumnoOut).

			% AlumnoIn = [1, "pepe", 7]
			% alumno(1, "pepe", 3, [1, "pepe", 7])
			% 			1 = 1  True
			% 			"pepe" = "pepe" True
			% 			3 = 7 False 
				% NewPromedio = 3

% RECESO HASTA 20.35 hrs
% LISTAS HASTA LAS 21 HRS


% Prolog tiene dos formas de realizar una asignación
% is  -> es sólo para números
% = -> el igual es para trabajar con listas y STRINGS


    

% (define (get_id alumno) car alumno) 
% (get_id alumno1) -> calculo lambda -> la salida solo depende de la entrada


%alumno(Arg1, Arg2, Arg3, [Arg1, Arg2, Arg3]).



%True or False = 1 + 0 = 1


	% alumno
		%OR
	%string(Nombre) OR number(ID)   
	% |
	% true         OR   false
		% | 
			%		true

%  _ : shadow variable
	% go -> int miNumero, _  = miFuncion()

% Listas

% L = [1,2,3]
% [Car | Cdr] = [1,2,3].

% [Primero | [Segundo| [Tercero | Resto] ]] = [ ["hola", 99, 98], 3,2,3].


% [Primero | [Segundo| [Tercero | [Cuarto|Resto]] ]] = [ ["hola", 99, 98], 3,2,3].



% CAR
car([Primero | _], Primero).
% CDR
cdr([_| Resto], Resto).

%agregarElementoAlPrincipio([1,2,3], 4, [4,1,2,3]).
%agregarElementoAlPrincipio(ListaIn, NewElemento, [NewElemento | ListaIn]).

agregarElementoAlPrincipio(Lista, Elemento, [Elemento|Lista]).



















