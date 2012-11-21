
And /^I am logged into the admin panel as "([^"]*)"$/ do |name|
  visit '/accounts/login'
  fill_in 'user_login', :with => name
  fill_in 'user_password', :with => 'zzzzzzzz'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^there is an article "([^"]*)" with text "([^"]*)"$/ do |title, text|
	Articles.create! {:title => title, :body => text}
end

