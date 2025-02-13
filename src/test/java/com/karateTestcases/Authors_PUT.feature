Feature: Authors API Test with PUT method

  Background: 
    * url 'https://fakerestapi.azurewebsites.net/api/v1/Authors'

  Scenario: Update an author successfully
    Given path '/9'
    And request
      """{
      "idBook": 1,
      "firstName": "American",
      "lastName": "Standard"
      }
      """
    When method PUT
    Then status 200
    And match response.firstName == "American"
    And match response.lastName == "Standard"

  Scenario: Attempt to update a non-existent author
    Given path '/9999'
    And request
      """{
      "idBook": 1,
      "firstName": "American",
      "lastName": "Standard"
      }
      """
    When method put
    Then status 200

  Scenario: Attempt to update author with invalid data type
    Given path '/9'
    And request
      """{
      "idBook": "one",
      "firstName": "",
      "lastName": "Standard"
      }
      """
    When method put
    Then status 400
    * print response
    And match response.errors['$.idBook'][0] contains 'The JSON value could not be converted to System.Int32'

  Scenario: Attempt to update author without request body
    Given path '/9'
    And request
    When method put
    Then status 415
    * print response
    And match response.title contains "Unsupported Media Type"

  Scenario: Attempt to update author with invalid request body
    Given path '/9'
    And request
      """{
      "abbb": "bbbb"
      
      }
      """
    When method put
    Then status 200
    * print response

  Scenario: Update author with partial data
    Given path '/9'
    And request
      """{
           "firstName": "American Book",
           "lastName": "Standard"
       }
      """
    When method put
    Then status 200
    And match response.firstName == "American Book"
    And match response.lastName == "Standard"
