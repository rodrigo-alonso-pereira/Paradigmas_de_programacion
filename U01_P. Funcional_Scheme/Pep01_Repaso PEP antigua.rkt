#lang racket

#|
REPASO PEP 1
Pregunta:
Se planea construir un sistema para un servicio de transporte urbano (como Uber o Lyft)
que permita vincular usuarios clientes con usuarios conductores a través de viajes. En
particular, un usuario cliente registrado con un correo electrónico puede solicitar un viaje
ingresando una dirección origen y una dirección destino. Respecto del viaje, este consta de
un identificador, el correo electrónico del conductor que acepta el viaje, el correo del cliente
que solicita el viaje, las direcciones de origen y destino, distancia total a recorrer
representada en kilómetros (km), tarifa por km recorrido, estado del viaje (ej: asignado,
rechazado, terminado), duración del viaje en minutos y finalmente el precio a pagar CLP.
En relación al usuario conductor, éste está registrado con un correo electrónico y cuenta
con un registro histórico de todos los viajes que ha realizado y aquellos que se le han
asignado (no necesariamente concretado). Estos últimos se van actualizando conforme el
conductor acepta o rechaza los viajes que se le asignen.
A partir de estos antecedentes:

a) (3 pts) Especificar el o los TDA(s) para abordar la construcción del sistema. En la
especificación de cada TDA (listado de operaciones), sólo considere lo
absolutamente necesario para cubrir los requerimientos de esta pregunta.

R:
TDA-UsuarioCliente = email x lista_viajes
TDA-Viajes = id x email_conductor x email_cliente x dir_origen x dir_destino x distancia_total_km x tarifa_km x estado_viaje x duracion_min x precio_clp
TDA-UsuarioConductor = email x lista_viajes_realizados x lista_viajes_asignados

TDA-Viajes -> get-distancia-viaje
           -> get-precio-viaje

b) (6 pts) Implementar el o los TDA(s) identificados. Procure señalar la representación
escogida para todos los TDAs. Luego implementación las funciones expresadas en
(a) (Solo aquellas que es absolutamente necesario para responder a los siguientes
ítems).
|#

(define get-distancia-viaje
  (lambda (viaje)
    (sixth viaje)))

(define get-precio-viaje
  (lambda (viaje)
    (last viaje)))

#|
c) (2 pts) Implementar una función que permita obtener el total de km recorridos de un
conductor considerando solo los viajes realizados.
|#

(define distancia-total
  (lambda (lista_viajes_realizados)
    (apply + (map get-distancia-viaje lista_viajes_realizados))))

