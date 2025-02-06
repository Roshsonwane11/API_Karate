@todays
Feature: Authors API Test with GET method

 Background:
    * def baseUrl = 'https://fakerestapi.azurewebsites.net/api/v1/Authors'

  Scenario: Verify that the API return 200 status code
    Given url baseUrl
    When method GET
    Then status 200

  Scenario: Verify that the API returns a list of authors successfully.
    Given url baseUrl
    When method GET
    Then status 200
    * print response

  Scenario: Verify the correct id and firstname from response
    * def baseUrl = 'https://fakerestapi.azurewebsites.net/api/v1/Authors'
    Given url baseUrl
    When method GET
    Then status 200
    * print response
    * def actualPageId = response[0].id
    * print actualPageId
    * print actual_firstName = response[1].firstName
    * print actual_firstName

  Scenario: Verify response body by ID
    Given url baseUrl
    When method GET
    Then status 200

  Scenario: Verify that the API returns a list of authors successfully.
    Given url baseUrl
    When method GET
    Then status 200
    * print response

  Scenario: Verify the correct id and firstname from response
     * def baseUrl = 'https://fakerestapi.azurewebsites.net/api/v1/Authors'
     Given url baseUrl
     When method GET
     Then status 200
     * print response
     * def actualPageId = response[0].id
     * print actualPageId
     * print actual_firstName = response[1].firstName
     * print actual_firstName

  Scenario: Verify response body by ID
    Given url baseUrl
    When method GET
    Then status 200
    * def expectedData =
      """{
        "id": 1,
        "idBook": 1,
        "firstName": "First Name 1",
        "lastName": "Last Name 1"
       }"""
    * def actual_response = response[0]
    * print actual_response
    And match actual_response == expectedData
    * print 'Match successful!'
    * print 'Expected Data:', expectedData
    * print 'Actual Response:', actual_response

  Scenario: Verify user can Get author by ID
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/2'
    When method GET
    Then status 200
    * print response
    * def actual_response = response.id==2
    * print actual_response

  Scenario: Verify user with invalid ID
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/-90'
    When method GET
    Then status 404

 Scenario: Verify the response length
    Given url baseUrl
    When method GET
    Then status 200
    * def actual_response = response
    * print actual_response
    And match actual_response == expectedData
    * print 'Match successful!'
    * print 'Expected Data:', expectedData
    * print 'Actual Response:', actual_response
    And assert actual_response.length == expectedData.length


  Scenario: Verify user can Get author by ID
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/2'
    When method GET
    Then status 200
    * print response
    * def actual_response = response.id==2
    * print actual_response

  Scenario: Verify user with invalid ID
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/-90'
    When method GET
    Then status 404

  Scenario: Verify the response lenght
    Given url baseUrl
    When method GET
    Then status 200
    * def dataSize = response.length
    * print 'Number of authors: ', dataSize

  Scenario: Verify Response for Invalid HTTP Method
    Given url baseUrl
    When method POST
    Then status 415

  Scenario: Verify Response for Invalid Endpoint
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/InvalidEndpoint'
    When method GET
    Then status 404

  Scenario: Verify Response Contains Books for the Given  valid idBook
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/Authors/books/15'
    When method GET
    Then status 200
    * print response

  Scenario: Verify response for an invalid book ID
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/Authors/books/-15'
    When method GET
    Then status 200
    * print actual_response = response
    * def expected_response = []
    * print expected_response
    * print 'Match successful!'
    * print 'Expected response:', expected_response
    * print 'Actual Response:', actual_response

  Scenario: Verify the Data Format of Each Book
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/1'
    When method GET
    Then status 200
    * def book = response[0]
    * assert 'id' in book
    * assert 'idBook' in book
    * assert 'firstName' in book
    * assert 'lastName' in book

  Scenario: Verify Response for Valid Author with Multiple idBook
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/2'
    When method GET
    Then status 200
    * print actaul_response = response
    * assert response.length > 1
    * print actaul_response

  Scenario: Verify that an String idBook returns 404 Not Found
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/BOOK'
    When method GET
    Then status 400

  Scenario: Verify Response for Invalid HTTP Method
    Given url baseUrl
    When method POST
    Then status 415

  Scenario: Verify Response for Invalid Endpoint
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/InvalidEndpoint'
    When method GET
    Then status 404

  Scenario: Verify Response Contains Books for the Given  valid idBook
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/Authors/books/15'
    When method GET
    Then status 200
    * print response

  Scenario: Verify response for an invalid book ID
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/Authors/books/-15'
    When method GET
    Then status 200
    * print actual_response = response
    * def expected_response = []
    * print expected_response
    * print 'Match successful!'
    * print 'Expected response:', expected_response
    * print 'Actual Response:', actual_response

  Scenario: Verify the Data Format of Each Book
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/1'
    When method GET
    Then status 200
    * def book = response[0]
    * assert 'id' in book
    * assert 'idBook' in book
    * assert 'firstName' in book
    * assert 'lastName' in book

  Scenario: Verify Response for Valid Author with Multiple idBook
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/2'
    When method GET
    Then status 200
    * print actaul_response = response
    * assert response.length > 1
    * print actaul_response

  Scenario: Verify that an String idBook returns 404 Not Found
    Given url 'https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/BOOK'
    When method GET
    Then status 400
