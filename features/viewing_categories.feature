Feature: viewing categories
  As a blog admin
  So that i can manage article categorization
  I want to be able view categories available
  
  Background:
    Given the blog is set up
    And the following categories exist:
    | name | position  | permalink |
    | cat1 | 1         | cat1      |
    | cat2 | 2         | cat2      |
    
    And I am logged into the admin panel
    
  Scenario: successfully view category list
    Given I am on the admin dashboard page
    When  I follow "Categories"
    Then  I should be on the admin categories page
    And   I should see "Categories" header
    And   I should see "cat1"
    And   I should see "cat2"
    
    