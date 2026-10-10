# language: es
@US-17
Característica: Acceder a la plataforma desde el call to action
  Como visitante o usuario registrado,
  quiero acceder a la plataforma desde la página de inicio por el canal que me corresponde,
  para empezar a operar sin buscar el enlace.

  Escenario: Acceso a la aplicación web
    Dado que un visitante del segmento propietario busca ingresar
    Cuando selecciona el call to action correspondiente
    Entonces es dirigido a la pantalla de inicio de sesión de la aplicación web

  Escenario: Acceso a la aplicación móvil
    Dado que un visitante del segmento técnico busca ingresar
    Cuando selecciona el call to action correspondiente
    Entonces es dirigido al punto de descarga de la aplicación móvil
