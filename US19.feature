Feature: Recepcionar alertas de riesgo de deserción por parte del padre de familia

  Como padre de familia
  Quiero recibir alertas automáticas cuando mi hijo sea identificado con riesgo de deserción en un tiempo máximo de 10 segundos
  Para tomar medidas a tiempo

  Scenario Outline: Recepción exitosa de alerta de riesgo
    Given que el padre de familia se encuentra registrado en la plataforma
    And el estudiante asociado es monitoreado por el sistema
    When el sistema detecta que el estudiante "<Estudiante>" supera el umbral de riesgo "<Umbral>" con un nivel de riesgo "<NivelRiesgo>"
    Then el sistema envía una alerta automática al padre de familia
    And el sistema muestra la información del riesgo detectado "<NivelRiesgo>"

    Examples:
      | Estudiante   | NivelRiesgo | Umbral |
      | Ana García   | 91%         | 80%    |
      | Luis Torres  | 87%         | 80%    |

  Scenario Outline: No generación de alerta por riesgo insuficiente
    Given que el padre de familia se encuentra registrado en la plataforma
    And el estudiante asociado es monitoreado por el sistema
    When el sistema evalúa que el estudiante "<Estudiante>" tiene un nivel de riesgo "<NivelRiesgo>" inferior al umbral "<Umbral>"
    Then el sistema no envía ninguna alerta automática al padre de familia
    And el sistema mantiene el estado normal del estudiante "<Estudiante>"

    Examples:
      | Estudiante      | NivelRiesgo | Umbral |
      | Carlos Mendoza  | 35%         | 80%    |
      | Sofía Ramírez   | 40%         | 80%    |

  Scenario Outline: Entrega oportuna de alerta
    Given que el sistema identifica un riesgo de deserción en el estudiante "<Estudiante>"
    When el sistema genera la alerta para el padre de familia
    Then la notificación debe recibirse en menos de "<TiempoMaximo>"
    And debe visualizarse correctamente en la plataforma

    Examples:
      | Estudiante   | TiempoMaximo |
      | Ana García   | 10 segundos  |
      | Luis Torres  | 10 segundos  |