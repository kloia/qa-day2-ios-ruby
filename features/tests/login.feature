Feature: Login Test Suite

  @smoke
  Scenario: Login successfully
    Given fill user name with company on login page
    And fill password with company on login page
    When click login button on login page
    Then verify login