login_page = LoginPage.new

Given(/^fill user name with (.*) on login page$/) do |username|
  login_page.fill_username(username)
end

And(/^fill password with (.*) on login page$/) do |password|
  login_page.fill_password(password)
end

When(/^click login button on login page$/) do
  login_page.click_login_button
end

Then(/^verify login$/) do
  login_page.verify_login
end