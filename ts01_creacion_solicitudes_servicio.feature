# language: es
@TS-01
Característica: Creación de solicitudes de servicio por API RESTful
  Como desarrollador,
  quiero implementar la API que permite crear solicitudes de servicio,
  para que los negocios reporten necesidades de soporte técnico.

  Escenario: Creación exitosa
    Dado que se envía POST a "/api/v1/service-requests" con equipmentId, type, priority y description
    Cuando la solicitud es procesada
    Entonces se recibe 201
    Y la solicitud queda registrada en estado "PENDING"
    Y la respuesta incluye su identificador

  Esquema del escenario: Campo obligatorio faltante
    Dado que se envía la solicitud sin el campo "<campo>"
    Cuando es procesada
    Entonces se recibe 400 "VALIDATION_ERROR" que lista los campos faltantes
    Y no se crea ninguna solicitud

    Ejemplos:
      | campo       |
      | equipmentId |
      | type        |
      | priority    |
      | description |

  Escenario: Equipo ajeno
    Dado que equipmentId no pertenece al propietario autenticado
    Cuando es procesada
    Entonces se recibe 404 "NOT_FOUND"
