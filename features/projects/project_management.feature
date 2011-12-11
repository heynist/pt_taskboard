Feature: Manage Projects
  As a user
  I want to manage projects

#Background:
#    Given an adviser exists
#    And   a modul exists with name: "Graduaat wiskunde"
#    And   I log on with the adviser


Scenario: List all projects
  Given project_taskboard exists
  And   project_planning_poker exists
  When  I go to the "projects" index
  Then  I should see "taskboard project" within "td"
  And   I should see "planning poker" within "td"
