Feature: Gestionar calificaciones de los estudiantes

  Como docente
  Quiero gestionar las calificaciones de los estudiantes
  Para mantener actualizada su información académica

  Scenario Outline: Registro exitoso de calificaciones
    Given que el docente se encuentra en la pantalla de gestión de calificaciones de su curso
    And el docente ha seleccionado al estudiante "<Alumno>"
    When el docente ingresa la nota "<Nota>" en el campo correspondiente de la evaluación "<Evaluacion>"
    And presiona el botón "Guardar calificaciones"
    Then el sistema muestra el mensaje de confirmación "Las calificaciones fueron registradas correctamente"
    And el sistema actualiza el promedio final del estudiante a "<Promedio>"

    Examples:
      | Alumno               | Evaluacion | Nota | Promedio |
      | Sofía Ramírez Torres | Práctica 1 | 16   | 16       |
      | Sofía Ramírez Torres | Parcial    | 16   | 16       |

  Scenario Outline: Intento de registro con formato de nota inválido
    Given que el docente se encuentra en la pantalla de gestión de calificaciones de su curso
    When el docente ingresa el valor "<ValorIngresado>" en el campo de calificación
    And presiona el botón "Guardar calificaciones"
    Then el sistema bloquea el guardado
    And muestra el mensaje de error "La nota debe estar entre 0 y 20"

    Examples:
      | ValorIngresado |
      | 25             |

  Scenario Outline: Intento de registro con campos vacíos
    Given que el docente se encuentra en la pantalla de gestión de calificaciones de su curso
    And ha seleccionado al estudiante "<Alumno>"
    When el docente deja vacío el campo obligatorio "<CampoVacio>"
    And presiona el botón "Guardar calificaciones"
    Then el sistema bloquea el registro
    And muestra el mensaje de alerta "Todos los campos obligatorios deben ser completados"

    Examples:
      | Alumno               | CampoVacio |
      | Sofía Ramírez Torres | Práctica 2 |
      | Sofía Ramírez Torres | Tareas     |
