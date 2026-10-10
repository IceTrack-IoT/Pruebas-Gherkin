# language: es
@TS-04
Característica: Registrar nuevo usuario a través de API RESTful
  Como desarrollador,
  quiero exponer un endpoint para registrar nuevos usuarios validando unicidad y formato,
  para permitir el acceso seguro de nuevos usuarios.

  Antecedentes:
    Dado que se envía POST a "/api/v1/users"

  Esquema del escenario: Registro exitoso
    Cuando la solicitud incluye un nombre de usuario "<usuario>" único de 4 a 30 caracteres (letras, dígitos, . o _)
    Y una contraseña de 8 a 64 caracteres con al menos una mayúscula, una minúscula y un dígito
    Y el rol "<rol>"
    Y la solicitud es procesada
    Entonces se recibe 201
    Y la respuesta devuelve el usuario sin incluir la contraseña ni su hash

    Ejemplos:
      | usuario   | rol             |
      | owner01   | OWNER_ROLE      |
      | tecnic001 | TECHNICIAN_ROLE |

  Escenario: Nombre de usuario ya registrado
    Dado que el nombre de usuario ya existe
    Cuando se intenta registrar nuevamente
    Entonces se recibe 409 "CONFLICT" con el mensaje "Username already registered"
    Y no se crea la cuenta

  Escenario: Formato o política incumplidos
    Dado que la contraseña, el nombre de usuario o el rol no cumplen las reglas establecidas
    Cuando es procesada
    Entonces se recibe 400 "VALIDATION_ERROR" que lista cada campo y la regla incumplida