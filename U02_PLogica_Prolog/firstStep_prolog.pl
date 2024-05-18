% Es una base de conocimiento
% No es compilado ni interpritado
% Es un lenguaje de consulta, como SQL
% Todo se ejecuta en base a pregunta
% Mundo cerrado, pq todo lo q se le enseña es verdad.
% No hay funciones

% Hechos: Son siempre True.
% Hecho es una regla que siempre es True

% banda_musical/1 (1 cantidad de argumentos)
banda_musical(metallica).
banda_musical(iron_maiden). 

% banda_musical/2 (2 argumentos)
banda_musical(beatles, 1960).
banda_musical(beatles, pop).

% banda_musical/3 (3 argumentos)
banda_musical(beatles, 1960, pop).

% simpsons/1
simpsons(homero).
simpsons(bart).
simpsons(lisa).

% True: Verdad.
% False: Hasta el momento, yo no puedo responder tu consulta.

% Prolog sirve para realizar consultas -> Simbolo comienza con mayusculas (recupera informacion)
% Cuando algo comienza con Mayusculas -> ESTO SON VARIABLES

% UNA CONSULTA ES UNA INCOGNITA
% UNA INCOGNITA ES UNA VARIABLE
% LA VARIABLE SE DESPEJA (o se escribe)

% AND: ,
% OR: ;
% TODO TERMINA EN .

% Definicion "funciones" -> aca reglas

% Meta Primaria (MP): aprobacion(Promedio)
% Meta Secundaria (MS): Promedio >= 4.
aprobacion(Promedio) :-
    Promedio >= 4.

% Respuesta:
% False: 1. No cumple la regla
% False: 2. Con el conocimiento no se puede responder.

% Variable | tipo de dato atomo (No significa nada)
%   Homero != homero


% LAB02

% vamos a esenarle a aprender a prolog

% Constructores
% station/5
% MP: station(Id, Name, Type, StopTime, [Id, Name, Type, StopTime]).
station(Id, Name, Type, StopTime, [Id, Name, Type, StopTime]).