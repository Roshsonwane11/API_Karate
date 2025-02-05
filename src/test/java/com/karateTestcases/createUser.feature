Feature: Create New User

Scenario: verify new user should be able to create
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
And request 
"""{
  "id": 11,
  "userName": "aa",
  "password": "striaang"
}"""
When method POST
Then status 200