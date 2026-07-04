Feature: Consultar reportes consolidados del aula

  Como docente
  Quiero consultar reportes consolidados de mi aula
  Para identificar tendencias y necesidades de mejora

  Scenario Outline: Visualización del reporte consolidado del aula
    Given que el docente se encuentra en el panel principal de la plataforma
    When hace clic en la opción "Reporte Consolidado del Aula"
    Then la aplicación muestra el promedio general del salón, el porcentaje de estudiantes aprobados y desaprobados, y las materias con menor rendimiento

    Examples:
      | Aula             |
      | 5° A Primaria    |
      | 3° B Secundaria  |

  Scenario Outline: Comparación entre periodos académicos
    Given que el docente visualiza el reporte consolidado del aula
    When selecciona los periodos académicos "<Periodo1>" y "<Periodo2>" para comparar
    Then la aplicación muestra la comparación del rendimiento entre ambos periodos
    And indica la variación del promedio general y del porcentaje de estudiantes aprobados

    Examples:
      | Periodo1    | Periodo2     |
      | I Bimestre  | II Bimestre  |
      | II Bimestre | III Bimestre |

  Scenario Outline: Consulta de estudiantes en riesgo académico
    Given que el docente visualiza el reporte consolidado del aula
    When hace clic sobre el indicador de estudiantes en riesgo
    Then la aplicación muestra la lista de estudiantes con bajo rendimiento académico
    And permite exportar la información para su seguimiento

    Examples:
      | Aula             |
      | 5° A Primaria    |
      | 3° B Secundaria  |