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
    
    
    
    
