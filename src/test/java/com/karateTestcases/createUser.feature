Feature: Create New User
Scenario: verify new user should be able to create
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
And request 
"""{
  "id": 11,
  "userName": "aa",
  "password": "striaang"
}"""
When method POST
Then status 200

  Scenario: Verify new user should be able to create successfully
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And request {"id": 11,"userName": "aa","password": "striaang"}
    When method POST
    Then status 200
    And match response.userName == 'aa'
    And match response.password == 'striaang'
    And match response.id == 11
    * print response

  Scenario: Verify new user should not be able to create with missing required fields
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And request {"id": ,"userName": null,"password": null}
    When method POST
    Then status 400
    And match response.title == 'One or more validation errors occurred.'
    * print response

  Scenario: Create user with invalid email and password format
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And request {"id": 13,"userName": 1,"password": 1}
    When method POST
    Then status 400
    And match response.title == 'One or more validation errors occurred.'

  Scenario: Create user with duplicate data
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And request {"id": 11,"userName": "aa","password": "striaang"}
    When method POST
    Then status 200

  Scenario: Verify new user creation entire response
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And request {"id": 11,"userName": "aa","password": "striaang"}
    When method POST
    Then status 200
    And match response == {"id": 11,"userName": "aa","password": "striaang"}
    * print response
<<<<<<< HEAD
=======

>>>>>>> master
