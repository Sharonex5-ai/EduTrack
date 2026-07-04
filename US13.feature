Feature: Generar reportes académicos automáticos

  Como docente
  Quiero generar reportes académicos automáticos de mis estudiantes
  Para realizar seguimiento de su desempeño

  Scenario Outline: Generación exitosa de reporte individual por estudiante
    Given que el docente se encuentra en la sección "Generación de Reportes"
    When selecciona al estudiante "<Estudiante>" de la lista
    And hace clic en el botón "Generar Reporte Automático"
    Then la aplicación genera el reporte académico individual del estudiante
    And muestra el resumen de notas, las fortalezas y los aspectos por mejorar

    Examples:
      | Estudiante   |
      | Ana García   |
      | Luis Torres  |

  Scenario Outline: Generación exitosa de reporte consolidado del aula
    Given que el docente se encuentra en la sección "Generación de Reportes"
    When selecciona el curso "<Curso>"
    And hace clic en el botón "Generar Reporte Grupal"
    Then la aplicación genera el reporte consolidado del aula seleccionada
    And muestra el promedio general del salón, las estadísticas de asistencia y la lista de estudiantes que requieren apoyo académico

    Examples:
      | Curso        |
      | 5° A Primaria |
      | 3° B Secundaria |

  Scenario Outline: Programación automática del envío de reportes
    Given que el docente configuró previamente la fecha de envío automático de reportes
    When se alcanza la fecha de cierre del período académico "<Periodo>"
    Then la aplicación genera automáticamente los reportes académicos de los estudiantes
    And envía cada reporte al correo electrónico registrado del padre de familia correspondiente

    Examples:
      | Periodo      |
      | I Bimestre   |
      | II Bimestre  |