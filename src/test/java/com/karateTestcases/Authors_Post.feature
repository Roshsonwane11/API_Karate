Feature: Test POST API to create an author

  Background: 
    * def baseUrl = 'https://fakerestapi.azurewebsites.net/api/v1/Authors'

  Scenario: Verify new user should be able to create
    Given url baseUrl
    And request { "id": 02, "idBook": 1, "firstName": "Java", "lastName": "basic" }
    When method POST
    Then status 200

 Scenario: Successfully create an author with valid data
  Given url baseUrl
  And request { "firstName": "John", "lastName": "Doe" }
  When method POST
  Then status 200
  And match response.firstName == 'John'
  And match response.lastName == 'Doe'
 
  Scenario: Successfully create a new author
    Given url baseUrl
    And request 
    """
    {
      "id": 101,
      "idBook": 90,
      "firstName": "Selenium",
      "lastName": "Grid"
    }
    """
    When method post
    Then status 200
    And match response == 
    """
    {
      "id": '#notnull',
      "idBook": 90,
      "firstName": "Selenium",
      "lastName": "Grid"
    }
    """
    * print responseHeaders
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8; v=1.0'

    

    
 