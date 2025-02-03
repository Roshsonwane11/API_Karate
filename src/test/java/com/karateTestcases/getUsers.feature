Feature: Get all Users List


Scenario: Verify all list of users is getting if request is valid
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
When method GET
Then status 200
* def expectedResponse = 
"""[{
    "id": 1,
    "userName": "User 1",
    "password": "Password1"
  },
  {
    "id": 2,
    "userName": "User 2",
    "password": "Password2"
  },
  {
    "id": 3,
    "userName": "User 3",
    "password": "Password3"
  },
  {
    "id": 4,
    "userName": "User 4",
    "password": "Password4"
  },
  {
    "id": 5,
    "userName": "User 5",
    "password": "Password5"
  },
  {
    "id": 6,
    "userName": "User 6",
    "password": "Password6"
  },
  {
    "id": 7,
    "userName": "User 7",
    "password": "Password7"
  },
  {
    "id": 8,
    "userName": "User 8",
    "password": "Password8"
  },
  {
    "id": 9,
    "userName": "User 9",
    "password": "Password9"
  },
  {
    "id": 10,
    "userName": "User 10",
    "password": "Password10"
  }]"""
  
* def actualResponse = response
And match actualResponse == expectedResponse
* print actualResponse


Scenario: Verify specific user fields from users list is getting properly
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
When method GET
Then status 200
And match response[0].id == 1
And match response[0].userName == "User 1"
And match response[0].password == "Password1"
* print response


Scenario: Verify valid user details are getting for valid user id
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
And path '1'
When method GET
Then status 200
* def expectedResponse = 
"""{
    "id": 1,
    "userName": "User 1",
    "password": "Password1"
  }"""
* def actualresponse = response
And match actualresponse == expectedResponse
* print actualresponse

Scenario: Verify behaviour with invalid user id 
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
And path '1000'
When method GET
Then status 404
And match response.title == "Not Found"

Scenario: Verify user details with empty user id 
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
And path ''
When method GET
Then status 200
Then print response

Scenario: Verify user details with valid userid but invalid format
* def baseURL = 'https://fakerestapi.azurewebsites.net/api/v1/Users'
Given url baseURL
And path '<1>'
When method GET
Then status 400
Then print response