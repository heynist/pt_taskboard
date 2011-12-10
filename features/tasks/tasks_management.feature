#Feature: Manage Task
#  As an Adviseur
#  I want to manage vakken
#
#  Background:
#    Given an adviser exists
#    And   a modul exists with name: "Graduaat wiskunde"
#    And   I log on with the adviser
#    And   I visit the modul
#
#  Scenario: Add vak to module
#    Given I click "Voeg vak toe"
#    And   I fill "wiskunde" in "Naam"
#    And   I fill "20" in "Aantal uren"
#    When  I click "Vak toevoegen"
#    Then  I should see "Graduaat wiskunde"
#    And   I should see "wiskunde" within "td"
#    And   I should see "20" within "td"
