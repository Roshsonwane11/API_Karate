Feature: Delete User scenario

  Background: 
    * url 'https://fakerestapi.azurewebsites.net'
    * path '/api/v1/Users/'
    * def requestPayload = read('classpath:requestPayload/updateUserRequest.json')
    

  Scenario: verify existing user data got deleted successfully
    Given path '11'
    And request requestPayload
    When method DELETE
    Then status 200
    * print response

  Scenario: verify status code when user delete invalid user id
    Given path '08988099999'
    When method DELETE
    Then status 400
    * print response

  Scenario: verify behaviour when user delete user with alreadydeleted id
    Given path '11'
    When method DELETE
    Then status 200
    * print response

  Scenario: Delete with an invalid ID (negative number)
    Given path '-1'
    When method delete
    Then status 200

  # The API should reject this request as invalid, but it will return 200 expected 400
  Scenario: Delete with an invalid ID (non-numeric)
    Given path 'abc'
    When method delete
    Then status 400

  Scenario: Delete an extremely large ID
    Given path '999999999999999999999999'
    When method delete
    Then status 400
