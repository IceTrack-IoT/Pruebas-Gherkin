# language: es
@TS-05
Característica: Consulta del estado de una solicitud por API
  Como desarrollador,
  quiero exponer un endpoint para consultar el estado de una solicitud de servicio,
  para que la web y el móvil muestren información consistente.

  Escenario: Consulta exitosa
    Dado que se envía GET a "/api/v1/service-requests/{id}" con un identificador válido
    Cuando la solicitud es procesada
    Entonces se recibe 200 con el estado actual
    Y se recibe el historial de transiciones

  Escenario: Identificador inexistente
    Dado que el identificador no corresponde a ninguna solicitud
    Cuando se realiza la consulta
    Entonces se recibe 404 con el mensaje "Service request not found"