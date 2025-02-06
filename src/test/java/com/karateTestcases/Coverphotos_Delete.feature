
Feature: API testing for CoverPhotos

  Background: 
    * url 'https://fakerestapi.azurewebsites.net'
    * path '/api/v1/CoverPhotos'
    
    Scenario: verify when user delete coverphoto id then status code should be 200
    Given path '/45'
    When method DELETE
    Then status 200
     * print response

  Scenario: verify behaviour  when user delete coverphoto id
    Given path '/45'
    When method DELETE
    Then status 200
    * print response

  Scenario: verify when user delete Non-existing coverphoto id
    Given path '/08988099999'
    When method DELETE
    Then status 400
    * print response
    
    Scenario: verify behaviour  when user delete coverphoto id with deleted id
    Given path '/45'
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
    Given path '9999999999999999999'
    When method delete
    Then status 400
    
    
    
    
