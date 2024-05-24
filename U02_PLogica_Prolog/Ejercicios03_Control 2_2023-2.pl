/*
Control 2 Paradigmas de Programación (2023-2)
Octubre
Duración: 45 minutos

(30 pts) Pregunta II (Procure responder todos los ítems de esta pregunta en esta 
misma hoja (puede usar ambos lados). Usar pseudoProlog.

En una aplicación musical, los usuarios pueden crear playlists y agregar canciones a ellas. 
Cada playlist tiene un cierto número de seguidores y cada canción un cierto número de 
reproducciones. Se ha construido una base de conocimiento usando el predicado:

%playlist(NombrePlaylist,Usuario,CantidadSeguidores, ListaCanciones).

Y otro predicado para las canciones:

%cancion(NombreCancion,Artista,CantidadReproducciones).

Algunos hechos basados en estos predicados son:

%hechos (no es una lista exhaustiva, son solo algunos casos de ejemplo)

playlist("Rock", "John", 5000, ["Stairway to Heaven", "Bohemian Rhapsody"]).
playlist("Pop", "Barbara", 12000, ["Yesterday, “Dancing Queen"]).

cancion("Stairway to Heaven", "Led Zeppelin", 2000000).
cancion("Bohemian Rhapsody", "Queen", 3000000).
cancion("Yesterday", "The Beatles", 1500000).
cancion("Dancing Queen", "Abba", 1081683588).

a) (5 pts) Implementar cláusulas para el predicado popularPlaylist(Playlist) que permite 
determinar si una playlist tiene más de 10.000 seguidores.
*/

% MP: playlist/5
playlist(NombrePlaylist, Usuario, CantidadSeguidores, ListaCanciones, 
         [NombrePlaylist , Usuario, CantidadSeguidores ,ListaCanciones]).

% MP: playlist_get_cantidadSeguidores/2
% MS: playlist(_, _, CantidadSeguidores, _, Playlist).
playlist_get_cantidadSeguidores(Playlist, CantidadSeguidores) :-
    playlist(_, _, CantidadSeguidores, _, Playlist).

% MP: popularPlaylist/1
% MS: playlist_get_cantidadSeguidores/2,
%     CantidadSeguidores > 10000.
popularPlaylist(Playlist) :-
    playlist_get_cantidadSeguidores(Playlist, CantidadSeguidores),
    CantidadSeguidores > 10000.

/*
b) (10 pts) Implementar cláusulas para el predicado 
cancionEnPlaylist(Cancion, Playlist) que permite consultar si una canción 
se encuentra en una determinada playlist.
*/

% MP: cancion/3.
cancion(NombreCancion, Artista, CantidadReproducciones, 
        [NombreCancion, Artista, CantidadReproducciones]).

% MP: cancion_get_nombreCancion/2
% MS: cancion/4.
cancion_get_nombreCancion(Cancion, NombreCancion) :-
    cancion(NombreCancion, _, _, Cancion).

% MP: playlist_get_listaCanciones/2
% MS: playlist/5.
playlist_get_listaCanciones(Playlist, ListaCanciones) :-
    playlist(_, _, _, ListaCanciones, Playlist).

% MP: pertenece/2
pertenece(Elemento, [Elemento|_]).

% MP: pertenece/2
% MS: pertenece/2.
pertenece(Elemento, [_|Resto]) :-
    pertenece(Elemento, Resto).

% MP: cancionEnPlaylist/2
% MS: cancion_get_nombreCancion/2,
%     playlist_get_listaCanciones/2,
%     pertenece/2.
cancionEnPlaylist(Cancion, Playlist) :-
    cancion_get_nombreCancion(Cancion, NombreCancion),
    playlist_get_listaCanciones(Playlist, ListaCanciones),
    pertenece(NombreCancion, ListaCanciones).
    
/*
c) (10 pts) Implemente cláusulas para el predicado
playlistsCompatibles(Playlist1, Playlist2, ReproduccionesMinimas) que determine 
si las dos playlists tienen al menos una canción en común y si dicha canción 
ha sido reproducida más veces que el valor de ReproduccionesMinimas proporcionado 
en la consulta.
*/    

% MP: playlistsCompatibles/3
% MS: playlist_get_listaCanciones/2,
%     pertenece/2,
%     cancion/4,
%     CantidadReproducciones > ReproduccionesMinimas.
playlistsCompatibles(Playlist1, Playlist2, ReproduccionesMinimas) :-
    playlist_get_listaCanciones(Playlist1, ListaCanciones1),
	playlist_get_listaCanciones(Playlist2, ListaCanciones2),
    pertenece(NombreCancion, ListaCanciones1),
    pertenece(NombreCancion, ListaCanciones2),
    cancion(NombreCancion, _, CantidadReproducciones, _),
    CantidadReproducciones > ReproduccionesMinimas.
            
/*
d) (5 pts) Documente el código.
*/












