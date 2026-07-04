Feature: Recepcionar alertas de riesgo de deserción por parte del docente

  Como docente
  Quiero recibir alertas automáticas cuando un alumno supere el umbral de riesgo de deserción en un tiempo máximo de 10 segundos
  Para intervenir oportunamente

  Scenario Outline: Recepción exitosa de alerta de riesgo estudiantil
    Given que el docente se encuentra registrado en la plataforma
    And el sistema monitorea el nivel de riesgo de deserción de los estudiantes
    When el sistema detecta que el alumno "<Alumno>" supera el umbral de riesgo "<Umbral>" con un nivel de riesgo "<NivelRiesgo>"
    Then el sistema genera una alerta automática para el docente
    And el sistema muestra los datos del alumno "<Alumno>" y el nivel de riesgo detectado "<NivelRiesgo>"

    Examples:
      | Alumno        | NivelRiesgo | Umbral |
      | Ana García    | 92%         | 80%    |
      | María Torres  | 88%         | 80%    |

  Scenario Outline: No generación de alerta por riesgo insuficiente
    Given que el docente se encuentra registrado en la plataforma
    And el sistema monitorea el nivel de riesgo de deserción de los estudiantes
    When el sistema evalúa que el alumno "<Alumno>" tiene un nivel de riesgo "<NivelRiesgo>" inferior al umbral "<Umbral>"
    Then el sistema no genera ninguna alerta automática para el docente
    And el sistema mantiene el estado normal de seguimiento del alumno "<Alumno>"

    Examples:
      | Alumno          | NivelRiesgo | Umbral |
      | Carlos Mendoza  | 35%         | 80%    |
      | Luis Pérez      | 42%         | 80%    |

  Scenario Outline: Tiempo de respuesta de la alerta
    Given que el sistema identifica que el estudiante "<Alumno>" supera el umbral de riesgo "<Umbral>"
    When el sistema genera una alerta automática para el docente
    Then la alerta debe mostrarse en la plataforma en un tiempo máximo de "<TiempoMaximo>"
    And el sistema registra correctamente el evento de alerta

    Examples:
      | Alumno       | Umbral | TiempoMaximo |
      | Ana García   | 80%    | 10 segundos  |
      | María Torres | 80%    | 10 segundos  |