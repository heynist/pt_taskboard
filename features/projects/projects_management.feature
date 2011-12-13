Feature: Manage Projects
  As a user
  I want to manage projects

Background:
#    Given an adviser exists
#    And   a modul exists with name: "Graduaat wiskunde"
#    And   I log on with the adviser
  Given project_taskboard exists
  And   project_planning_poker exists
  When  I go to the "projects" index


  Scenario: List all projects
    Then  I should see "taskboard project" within "td"
    And   I should see "planning poker" within "td"

  Scenario: Should show no members when project has no members yet
    When  I visit project_taskboard
    Then  I should see "No members yet"

  Scenario: Should show memberships when project has members
    When  a membership exists
    And   membership is one of the project_taskboard's memberships
    And   I visit project_taskboard
    Then  I should see "Steven Heyninck" within "table[@id='memberships']//td"

  Scenario: Should show not iterations when project has none
    Then  I visit project_taskboard
    And   I should see "No iterations yet"
