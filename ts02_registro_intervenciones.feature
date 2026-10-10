# language: es
@TS-02
Característica: Registro de intervenciones técnicas por API RESTful
  Como desarrollador,
  quiero registrar las intervenciones realizadas a través de la API,
  para llevar un seguimiento detallado del mantenimiento.

  Escenario: Registro exitoso
    Dado que se envía POST a "/api/v1/interventions" con la solicitud, el técnico, el diagnóstico y las acciones ejecutadas
    Cuando la solicitud es procesada
    Entonces se recibe 201
    Y la intervención se almacena
    Y la solicitud padre pasa a "COMPLETED"

  Escenario: Técnico inexistente
    Dado que el identificador del técnico no existe
    Cuando se realiza la solicitud
    Entonces se recibe 404 con el mensaje "Technician not found"
