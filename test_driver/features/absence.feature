Feature: Faltas
  The pages should appear when we click on the respective menu options

  Scenario: access the "Faltas" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Faltas" button
    Then I expect the text "Faltas" to be present

  Scenario: access the "Faltas por cadeira" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Faltas" button
    Then I expect the text "Faltas" to be present
    When I tap the "Absence_DA" widget
    Then I expect the text "Faltas a DA" to be present
