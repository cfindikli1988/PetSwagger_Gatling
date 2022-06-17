Feature: it is for creating pet in the API

  Background:
    Given url "https://petstore.swagger.io/v2"

  @name=post
  Scenario: post the pets
    * def pet =
    """
      {
        "name": "kloia_pet",
        "status": "available"
      }
    """
    * request pet
    * path '/pet'
    When method POST
    * print response
    Then status 200

  @name=simple
  Scenario: basic
    * path '/pet/findByStatus?status=available'
    When method GET
    Then status 200
