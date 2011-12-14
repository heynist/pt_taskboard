Feature: Manage Iterations
  As a user
  I want to manage iterationss

Background:
  Given project_planning_poker exists
  And   an iteration exists
  And   the iteration is one of project_planning_poker's iterations

  Scenario: List all stories of an iteration if stories exist
    Given a story exists
    And   the story is one of the iteration's stories
    When  I visit project_planning_poker
    And   I click "Show"
    Then  I should not see "No stories (yet)"

  Scenario: Show 'no stories (yet)' if an iteration has no stories
    Given I visit project_planning_poker
    And   I click "Show"
    Then  I should see "No stories (yet)"
