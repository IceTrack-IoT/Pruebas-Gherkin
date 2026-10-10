# language: es
@US-02
Característica: Inicio de sesión
  Como usuario,
  quiero iniciar sesión con mi cuenta,
  para acceder a la plataforma y a mi panel según mi rol.

  Antecedentes:
    Dado que el usuario tiene una cuenta activa

  Esquema del escenario: Inicio de sesión exitoso
    Cuando envía su nombre de usuario "<usuario>" y su contraseña registradas
    Entonces la API responde 200 con un JWT de 60 minutos de vigencia
    Y el usuario es dirigido a su panel según su rol "<rol>"

    Ejemplos:
      | usuario   | rol        |
      | owner01   | Owner      |
      | tecnic001 | Technician |

  Esquema del escenario: Credenciales incorrectas
    Dado que el usuario envía "<campo_invalido>"
    Cuando intenta iniciar sesión
    Entonces la API responde 401 UNAUTHORIZED con el mismo mensaje en ambos casos, sin revelar cuál campo falló
    Y no emite JWT
    Y el intento queda registrado

    Ejemplos:
      | campo_invalido                                 |
      | un nombre de usuario inexistente               |
      | una contraseña que no coincide                 |

  Esquema del escenario: Campos vacíos
    Dado que el usuario deja vacío el campo "<campo>"
    Cuando intenta iniciar sesión
    Entonces la API responde 400 VALIDATION_ERROR indicando el campo faltante

    Ejemplos:
      | campo       |
      | nombre de usuario |
      | contraseña  |