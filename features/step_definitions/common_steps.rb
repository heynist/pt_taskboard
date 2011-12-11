When /^I go to the "([^"]*)" index$/ do |model|
  visit send("#{model.pluralize}_path")
end

When /^I go to new "([^"]*)"$/ do |model|
  visit send("new_#{model.singularize}_path")
end

When /^I click "([^"]*)"$/ do |selector|
  click_link_or_button selector
end

When /^I click "([^\"]*)" within "([^\"]*)"$/ do |selector,scope_selector|
  within(scope_selector) do
    click_link_or_button(selector)
  end
end

When /^I select "([^"]*)" within "([^"]*)"$/ do |value, selector|
  page.select value, :from => selector
end

When /^I fill "([^"]*)" in "([^"]*)"$/ do |value, selector|
  fill_in selector, with: value
end

When /^I visit #{capture_model}$/ do |name|
  visit url_for(model!(name))
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  find(:xpath, "//#{selector}[contains(text(),'#{text}')]").should_not(be_nil, "Could not find the text '#{text}' within the selector '#{selector}'")
end

Then /^I should not see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  page.has_xpath?("//#{selector}[contains(text(),'#{text}')]").should be_false
end

Then /^I should see "([^"]*)"$/ do |text|
  page.has_content?("#{text}").should(be_true, "Could not find the text '#{text}'")
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.has_content?("#{text}").should(be_false, "Found the text '#{text}', but should not have found it")
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should receive a 404 response code when I visit a forbidden page$/ do
  lambda {
    visit new_traject_path
  }.should raise_error(ActionController::RoutingError)
end

Then /^"([^\"]*)" should( not)? be disabled$/ do |label, negate|
  element = begin
    find_button(label)
  rescue Capybara::ElementNotFound
    find_field(label)
  end
  ["false", "", nil].send(negate ? :should : :should_not, include(element[:disabled]))
end

Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  assert page.has_xpath?("//label[contains(text(),'#{field}')]/..//option[@selected = 'selected' and contains(string(), '#{value}')]")
end

Then /^nothing should be selected for "([^"]*)"$/ do |field|
  page.should have_no_xpath("//label[contains(text(),'#{field}')]/..//option[@selected = 'selected']")
end

#inspired by https://makandracards.com/makandra/929-cucumber-steps-to-test-input-fields-for-equality-instead-of-inclusion
Then /^the field "([^\"]*)" should(not )? (?:equal|contain|be) "([^\"]*)"$/ do |field, negate, value|
  expectation = negate ? :should_not : :should
  #with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if value.blank? # Capybara returns nil for empty fields, so we can't test for equality
      field_value.send(expectation, be_blank)
    else
      field_value.send(expectation) == value
    end
  #end
end

Then /^I check the (\d+)(st|nd|rd|th) checkbox$/ do |index, junk|
  page.all("input[type='checkbox']")[index.to_i-1].set(true)
end

# ------------------------------------------------
# piclke-like step definitions
# ------------------------------------------------

Given /^#{capture_model} is one of #{capture_model}'s ([^\"]*)$/ do |owned, owner, assoc|
   model!(owner).send(assoc) << model!(owned)
end

# ------------------------------------------------
# javascript and AJAX
# ------------------------------------------------

When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end

Given /^I wait (\d+) seconds?$/ do |sec|
  sleep(sec.to_i)
end