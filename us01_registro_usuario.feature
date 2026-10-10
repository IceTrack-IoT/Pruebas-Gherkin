# language: es
@US-01
Característica: Registro de usuario
  Como nuevo usuario,
  quiero registrarme indicando si soy propietario de negocio o técnico,
  para acceder a la plataforma con las capacidades que corresponden a mi rol.

  Antecedentes:
    Dado que el nuevo usuario accede al formulario de registro

  Esquema del escenario: Creación exitosa de la cuenta
    Cuando ingresa un nombre de usuario único de 4 a 30 caracteres (letras, dígitos, . o _)
    Y una contraseña de 8 a 64 caracteres con al menos una mayúscula, una minúscula y un dígito
    Y selecciona el rol "<rol>"
    Entonces la API responde 201
    Y el sistema crea la cuenta
    Y genera el perfil correspondiente a ese rol
    Y redirige al usuario a la plataforma

    Ejemplos:
      | rol             |
      | OWNER_ROLE      |
      | TECHNICIAN_ROLE |

  Escenario: Nombre de usuario ya registrado
    Dado que el usuario envía el formulario con un nombre de usuario existente
    Cuando el sistema procesa la solicitud
    Entonces la API responde 409 CONFLICT
    Y el formulario muestra que el nombre de usuario no está disponible
    Y no se crea la cuenta

  Esquema del escenario: Contraseña que no cumple la política
    Dado que el usuario ingresa una contraseña "<contraseña>" con menos de 8 caracteres o sin alguna mayúscula, minúscula o dígito
    Cuando intenta registrarse
    Entonces la API responde 400 VALIDATION_ERROR
    Y el formulario lista cada requisito incumplido
    Y no se crea la cuenta

    Ejemplos:
      | contraseña      |
      | corta1          |
      | minusculasy1    |
      | MAYUSCULASY1    |
      | ClaveSinDigito  |
