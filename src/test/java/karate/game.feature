#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios

@Tag ggames
Feature: Get a Game from Library

  Background:
    * url baseUrl
    * def gameBase = '/game'
    * def gameCategoryUri = '/category'
 		
  Scenario Outline: Get a game by name

    Given path gameBase+"/" , '<name>'
    And 	header Accept = 'application/json'
    When 	method GET
    Then 	status 200
    And 	match $ contains {data: '#notnull'}
    
    Examples:
   | name       			| id              |
   | Doom						 	| 114							|
   | God of War				| 113							|
   
	Scenario Outline: Get the game from category

 		Given path gameBase+gameCategoryUri, '<category>'
    And 	header Accept = 'application/json'
    When 	method GET
    Then 	status 200
    And 	match $ contains {data: '#notnull'}
    
     Examples:
   | category					|
   | Adventures				|
   | Fight						|
   | Shooter					|
