Feature: Authors API Test with DELETE method

  Background: 
    * url 'https://fakerestapi.azurewebsites.net/api/v1/Authors'

  Scenario: verify an existing author Delete successfully
    Given path '/1'
    When method DELETE
    Then status 200
    And print response == false

  Scenario: Delete a non-existent author
    Given path '99999'
    When method delete
    Then status 404
    # this going to fail API returns 404, meaning the resource wasn’t found, but it will return 200
  
  Scenario: Delete with an invalid ID (negative number)
    Given path '-1'
    When method delete
    Then status 400
    # The API should reject this request as invalid, but it will return 200
  
  Scenario: Delete with an invalid ID (non-numeric)
    Given path 'abc'
    When method delete
    Then status 400

  Scenario: Delete an extremely large ID
    Given path '9999999999999999999'
    When method delete
    Then status 400
