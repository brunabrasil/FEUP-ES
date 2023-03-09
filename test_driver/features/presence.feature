Feature: Marcar presença
  The pages should appear when we click on the respective menu options

  #TODO: How can you add time mocks to the scenario?
  Scenario: access the "Marcar Presença" page (no aula)
    Given I am logged in
    And I open the drawer
    And I tap the "key_Marcar Presença" button
    #When I am not in class
    Then I expect the text "Não estás a ter nenhuma aula no momento" to be present

  Scenario: access the "Marcar Presença" page (aula teórica)
    Given I am logged in
    And I open the drawer
    And I tap the "key_Marcar Presença" button
    #When I am in theoretical class
    Then I expect the text "Estás a ter aula teórica de" to be present

  Scenario: access the "Marcar Presença" page (aula prática)
    Given I am logged in
    And I open the drawer
    And I tap the "key_Marcar Presença" button
    #When I am in pratical class
    Then I expect the widget "Qr_code" to be present within 0 seconds
    And I expect the button "Request_button" to be present within 0 seconds
    When I tap the "Request_button" button
    Then I expect the widget "Request_notification" to be present within 0 seconds

  Scenario: access the "Registar Presença" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Registar Presença" button
    Then I expect the text "Pedidos de presença" to be present

  Scenario: access the "Pedidos de presença" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Registar Presença" button
    Then I expect the text "Pedidos de presença" to be present
    And I tap the "buttonRequests" button
    Then I expect the text "Pedidos de presença" to be present

  Scenario: access the "Alunos" page
    Given I am logged in
    And I open the drawer
    And I tap the "key_Registar Presença" button
    Then I expect the text "Marcar presença por nome" to be present
    And I tap the "presenceName" button
    Then I expect the text "Alunos" to be present
