Feature: creating categories
  As a blog admin
  So that I can manage article categorization
  I want to be able to create categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: successfully creates category
    Given I am on the admin dashboard page
    When  I follow "Categories"
    And   I fill in "Name" with "Category Test 1"
    And   I press "Save"
    Then  I should see "Category was successfully saved."
    And   I should see "Category Test 1"