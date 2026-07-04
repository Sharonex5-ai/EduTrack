Feature: Consultar el rendimiento académico

  Como docente
  Quiero consultar el rendimiento académico de mis estudiantes
  Para identificar oportunidades de mejora

  Scenario Outline: Visualización del rendimiento general del estudiante
    Given que el docente se encuentra en el panel de rendimiento académico
    When el docente selecciona al estudiante "<Alumno>" de la lista desplegable
    Then el sistema muestra el historial de calificaciones del estudiante
    And muestra el promedio general actual "<Promedio>"
    And muestra el gráfico de evolución académica

    Examples:
      | Alumno               | Promedio |
      | Sofía Ramírez Torres | 16       |
      | María Torres         | 15.9     |

  Scenario Outline: Búsqueda de un estudiante sin registros académicos
    Given que el docente se encuentra en el panel de rendimiento académico
    When el docente selecciona al estudiante "<Alumno>" sin registros académicos
    Then el sistema muestra una pantalla limpia
    And presenta el mensaje informativo "El estudiante no cuenta con calificaciones registradas para el periodo"

    Examples:
      | Alumno        |
      | Diego López   |
      | Ana García    |

  Scenario Outline: Exportación exitosa del reporte de rendimiento
    Given que el docente se encuentra en el panel de rendimiento académico
    And ha seleccionado al estudiante "<Alumno>" con registros válidos
    When el docente presiona el botón "Exportar Reporte"
    Then el sistema genera un archivo descargable en formato "<Formato>"
    And el documento contiene el historial de calificaciones, el promedio y el gráfico de evolución del estudiante

    Examples:
      | Alumno               | Formato |
      | Sofía Ramírez Torres | PDF     |
      | María Torres         | Excel   |