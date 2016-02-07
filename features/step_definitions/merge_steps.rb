Given /^the following articles exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  Article.create table.hashes
  # table.hashes.each do |article|
  #   Factory.create(:article, article)
  # end
end

Given /^I login as a regular user$/ do
  # regular_user = FactoryGirl.create(:user)
  visit '/accounts/login'
  fill_in 'user_login', with: 'noadmin'
  fill_in 'user_password', with: 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^I login as an admin user$/ do
  # admin_profile = FactoryGirl.create(:profile_admin)
  # admin_user = FactoryGirl.create(:user, profile: admin_profile)
  
  visit '/accounts/login'
  fill_in 'user_login', with: 'admin'
  fill_in 'user_password', with: 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Then /^the merged article "(.*?)" should have body "(.*?)"$/ do |title, body|
  article = Article.find(:first, conditions: ['title = ?', title])
  expect(article.body).to eq body
end

When /^I merge articles "(.*?)" and "(.*?)"$/ do |a1, a2|
  visit "/admin/content/edit/#{ Article.find_by_title(a1).id }"
  fill_in 'merge_with', with: Article.find_by_title(a2).id
  click_button 'Merge'
  expect(page.body).to include "Article was successfully merged"
end

Then /^I should see just one single instance of article "(.*?)"$/ do |article_title|
  visit '/admin/content'
  page.all('a', text: article_title).size.should == 1
end