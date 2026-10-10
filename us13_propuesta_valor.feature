# language: es
@US-13
Característica: Visualizar la propuesta de valor principal
  Como visitante,
  quiero conocer la propuesta de valor de la plataforma,
  para entender si se ajusta a mis necesidades.

  Escenario: Propuesta visible al ingresar
    Dado que un visitante llega a la página principal
    Cuando la página carga
    Entonces se le presenta un enunciado que explica con claridad la propuesta de valor

  Escenario: Contenido orientado a la cadena de frío
    Dado que el visitante pertenece al segmento de gestión de equipos
    Cuando revisa la propuesta de valor
    Entonces encuentra conceptos de monitoreo inteligente
    Y encuentra conceptos de protección del inventario refrigerado
