Given /^the following categories exist:$/ do |categories_table|
  # table is a Cucumber::Ast::Table
  categories_table.hashes.each do |category|
    Category.create!({name: category[:name], position: category[:position], permalink: category[:permalink]})
  end
end

Given /^the following comments exist$/ do |table|
  Comment.create! table.hashes
end

Then /^I should see "(.*?)" header$/ do |header_text|
  page.should have_css '.page-header', text: header_text
end

Then /^I should see "(.*?)" before "(.*?)"$/ do |c1, c2|
  page.body.should =~ /#{c1}.*#{c2}/m
end