Then /^I should see a form for adding a new (.*) collector$/ do |source|
  page.should have_content("New #{source} Collector")
end

Then /^I should see an? (.*) collector for "([^"]*)"$/ do |source, configuration_summary|
  within(:css, ".collector") do
    page.should have_css('.collector-source', :text => source)
    page.should have_css('.collector-configuration', :text => configuration_summary)
  end
end
