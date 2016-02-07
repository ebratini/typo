Feature: merging articles
  As a blog user
  In order to prevent article duplicity
  I want to be able to merge articles
  
  Background:
    Given the blog is set up
    And the following articles exist:
    | id | title          | body  | published |
    | 3  | test article   | lorem | true      |
    | 4  | test article 2 | ipsum | true      |
    
    And the following comments exist:
    | article_id | author | body              |
    | 3          | joe    | comment1 4 atcl 1 |
    | 4          | doe    | comment2 4 atcl 2 |
  
  Scenario: non-admin users cannot merge articles
    Given I login as a regular user
    When  I go to the edit page for article "test article"
    Then  I should not see "Merge Articles"
    
  Scenario: merge article form should render only in article's edit page
    Given I login as an admin user
    When  I go to the new article page
    Then  I should not see "Merge Articles"
  
  Scenario: admin users can successfully merge articles
    Given I login as an admin user
    When  I go to the edit page for article "test article"
    And   I fill in "merge_with" with "4"
    And   I press "Merge"
    Then  I should see "Article was successfully merged"
    And   I should see "test article"
    
  Scenario: should create a single merged article
    Given I login as an admin user
    When  I merge articles "test article" and "test article 2"
    Then  I should be on the articles home page
    And   I should see just one single instance of article "test article"
    And   I should not see "test article 2"
    
  Scenario: new merged article should have the text of both original articles
    Given I login as an admin user
    When  I merge articles "test article" and "test article 2"
    And   I go to the edit page for article "test article"
    Then  I should see "lorem"
    And   I should see "ipsum"
    
  Scenario: comments should be transferrered after article merge
    Given  I login as an admin user
    When   I merge articles "test article" and "test article 2"
    And    I go to the comments page for article "test article"
    Then   I should see "comment1 4 atcl 1"
    And    I should see "comment2 4 atcl 2"