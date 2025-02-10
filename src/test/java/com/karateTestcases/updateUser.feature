Feature: Update User scenario

  Scenario: verify existing user data got updated successfully
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And path '11'
    And request {"id": 11,"userName": "bb_updated","password": "striaang_updated"}
    When method PUT
    Then status 200
    * print response

  Scenario: verify all fields in response are matching with request for updated user
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And path '11'
    And request {"id": 11,"userName": "bb_updated","password": "striaang_updated"}
    When method PUT
    Then status 200
    And match response.userName == 'bb_updated'
    And match response.password == 'striaang_updated'
    And match response.id == 11
    * print response

  Scenario: verify entire response format is matching correct for updated user
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And path '11'
    And request {"id": 11,"userName": "bb_updated","password": "striaang_updated"}
    When method PUT
    Then status 200
    * def expectedResponse =
      """
      {"id": 11,
      "userName": "bb_updated",
      "password": "striaang_updated"}
      """
    * def actualResponse = response
    And match actualResponse == expectedResponse
    * print response

  Scenario: verify user is getting error when not passed mandatory parameter id for update
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And request {"id": 11,"userName": "bb_updated","password": "striaang_updated"}
    When method PUT
    Then status 405
    * print response

  Scenario: verify response when given empty id for update user
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And path ''
    And request {"id": ,"userName": "bb_updated","password": "striaang_updated"}
    When method PUT
    Then status 405

  Scenario: verify response when given all fileds empty in request for update user
    * def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
    Given url baseURL
    And path '11'
    And request {"id": ,"userName": "","password": ""}
    When method PUT
    Then status 400
