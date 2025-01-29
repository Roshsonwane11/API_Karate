Feature: list of users for Reqres
  Scenario: To verify list of user for page wise  
 
    Given url baseUrl
    When method GET
    Then status 200
    * print response  
    * def expectedPageNumber = 2
    *	def actualPageNumber = response.page
    * print actualPageNumber 
    * match actualPageNumber == expectedPageNumber  
   
    Scenario: To verify single user 
    *	def	baseURLForSingelUser = 'https://reqres.in/api/users/2'
    Given url baseURLForSingelUser
    When method GET
    Then status 200
    * print response
    *	def actualuserID = response.data.id
    * print actualuserID    