Feature: List of users for Reqres API

  Scenario: Verify list of users for page 2
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200

Scenario: verify single user
  Given url 'https://reqres.in/api/users/2'
  When method GET
  Then status 200