@Tag ggames
Feature: Get list of games

  Background:
    * url baseUrl
    * def gameBase = '/games'

  Scenario: Get the game list

    Given path gameBase
    And header Accept = 'application/json'
    When method GET
    Then status 200
