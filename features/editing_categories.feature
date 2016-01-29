Feature: editing categories
  As a blog admin
  So that i can manage article categorization
  I want to be able to edit categories
  
  Background:
    Given the blog is set up
    And the following categories exist:
    | name | position | permalink |
    | cat1 | 1        | cat1      |
    
    And I am logged into the admin panel
    
  Scenario: successfully edit category
    When  I go to the "edit" action page for category "cat1"
    And   I fill in "Name" with "Category 1"
    And   I fill in "Description" with "Category 1 Description"
    And   I press "Save"
    Then  I should see "Category 1"
    And   I should see "Category 1 Description"