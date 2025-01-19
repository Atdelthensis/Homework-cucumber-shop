Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Milk" with price 15.00 and stock of 15 exists
    And a product "Biscuit" with price 10.00 and stock of 20 exists
    And a product "Chocolate" with price 35.00 and stock of 25 exists
    And a product "Eclair" with price 50.00 and stock of 0 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario: Buy multiple products
    When I buy "Milk" with quantity 2
    And I buy "Biscuit" with quantity 5
    And I buy "Chocolate" with quantity 1
    Then total should be 115.00

Scenario: Stock is insufficient to buy one product
    When I buy "Eclair" with quantity 100000
    Then an InsufficientStockException should be thrown

Scenario: Stock is insufficient to buy multiple products
    When I buy "Chocolate" with quantity 1549845
    When I buy "Biscuit" with quantity 8554135
    Then an InsufficientStockException should be thrown

Scenario Outline: Buy multiple products
   When I buy <product> with quantity <quantity>
   Then total should be <total>
   Examples:
       | product  | quantity |  total  |
       | "Bread"  |     1    |   20.50 |
       | "Jam"    |     2    |  160.00 |

Scenario Outline: Stock is insufficient to buy multiple products
   When I buy <product> with quantity <quantity>
   Then an InsufficientStockException should be thrown
   Examples:
       | product      | quantity |
       | "Chocolate"  |   242    |
       | "Biscuit"    |   512    |
       | "Eclair"     |   131    |