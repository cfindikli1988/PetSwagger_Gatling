Feature: SwaggerExampleForQA
  Background:
    * url 'https://petstore.swagger.io'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'
    * header api_key = 'api_key'

  Scenario: Test of the Post method: Add a new pet to the store
    Given path '/v2/pet'
    And request {"id": 1323123131321,"category": {"id": 321312,"name": "Brown"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 9,"name": "Evcil"}],"status": "available"}
    When method post
    Then status 200
    And print response
    And print responseStatus
    And print responseTime

  Scenario: Test of the Post method: Update an existing pet
    Given path '/v2/pet'
    And request {"id": 1323123131321,"category": {"id": 321312,"name": "Yellow"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 9,"name": "Evcil"}],"status": "available"}
    When method put
    Then status 200
    And print response
    And print responseStatus
    And print responseTime

  Scenario: Test of the Post method: Finds Pets by status
    Given path '/v2/pet/1323123131321'
    And request {}
    When method get
    Then status 200
    And print response
    And print responseStatus

  Scenario: Test of the Post method: Place an order for a pet
    Given path '/v2/store/order'
    And request {"id": 5,"petId": 20,"quantity": 25,"shipDate": "2022-06-10T09:40:35.116Z","status": "placed","complete": true}
    When method post
    Then status 200
    And print response
    And print responseStatus
    And print responseTime

  Scenario: Test of the Post method: Find purchase order by ID
    Given path '/v2/store/order/5'
    And request {}
    When method get
    Then status 200
    And print response
    And print responseStatus
    And print responseTime

  Scenario: Test of the Post method: Delete purchase order by ID
    Given path '/v2/store/order/5'
    And request {}
    When method delete
    Then status 200
    And print response
    And print responseStatus

