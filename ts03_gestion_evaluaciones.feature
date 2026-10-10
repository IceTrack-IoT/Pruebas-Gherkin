# language: es
@TS-03
Característica: Gestión de evaluaciones de servicio vía API
  Como desarrollador,
  quiero implementar los endpoints que permiten registrar y actualizar una evaluación de servicio,
  para reflejar la experiencia del cliente.

  Escenario: Evaluación inicial
    Dado que el cliente recibió un servicio completado
    Cuando se envía POST a "/api/v1/reviews" con las puntuaciones de 1 a 5
    Entonces se recibe 201
    Y la evaluación queda almacenada junto a su fecha límite de edición

  Escenario: Edición fuera de plazo
    Dado que transcurrieron más de 48 horas desde la evaluación
    Cuando se envía PUT a "/api/v1/reviews/{id}"
    Entonces se recibe 409 con el mensaje "Review edit window expired"
    Y la evaluación no se modifica
