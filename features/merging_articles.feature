Feature: merging articles
  As a blog user
  In order to prevent article duplicity
  I want to be able to merge articles
  
  Background:
    Given the blog is set up
    And the following articles exist:
    | id | title          | body  |
    | 2  | test article   | lorem |
    | 3  | test article 2 | ipsum |
  
  Scenario: non-admin users cannot merge articles
    Given I login as a regular user
    When  I go to the article page for "test article"
    Then  I should not see "Merge Articles"
  
  Scenario: admin users can successfully merge articles
    Given I login as an admin user
    When  I go to the article page for "test article"
    And   I fill in "merge_with" with "3"
    And   I press "Merge"  
    Then  the article "test article" should have body "lorem ipsum"