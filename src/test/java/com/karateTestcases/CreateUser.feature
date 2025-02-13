
Feature: Create New User

Background: 
    * url 'https://fakerestapi.azurewebsites.net'
    * path '/api/v1/Users/'
    * def requestPayload = read('classpath:requestPayload/createUserRequestValid.json')
    * def responsePayloadForNewUser = read('classpath:responsePayload/createUserResponseForNewUser.json')
    
  Scenario: verify new user should be able to create 
    Given request requestPayload
    When method POST
    Then status 200

  Scenario: Verify new user should be able to create successfully
    Given request requestPayload
    When method POST
    Then status 200
    And match response.userName == 'aa'
    And match response.password == 'striaang'
    And match response.id == 11
    * print response

  Scenario: Verify new user should not be able to create with missing required fields
    Given request {"id": ,"userName": null,"password": null}
    When method POST
    Then status 400
    And match response.title == 'One or more validation errors occurred.'
    * print response

  Scenario: Create user with invalid email and password format
    Given request {"id": 13,"userName": 1,"password": 1}
    When method POST
    Then status 400
    And match response.title == 'One or more validation errors occurred.'

  Scenario: Create user with duplicate data
    Given request {"id": 11,"userName": "aa","password": "striaang"}
    When method POST
    Then status 200

  Scenario: Verify new user creation entire response
    Given request requestPayload
    When method POST
    Then status 200
    And match response == responsePayloadForNewUser
    * print response
