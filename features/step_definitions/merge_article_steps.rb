
And /^there is a publisher "([^"]*)"$/ do |name|
  User.create!({:login => name,
                :password => 'zzzzzzzz',
                :email => '#{name}@snow.com',
                :profile_id => 2,
                :name => name,
                :state => 'active'})
end

Given /^there is a publisher logged into the admin panel as "([^"]*)"$/ do |name|
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

And /^there is an article "([^"]*)" with text "([^"]*)"$/ do |title, body|
	article = Article.create(:title => title, :body => body)
end

When /^(?:|I )follow "([^"]*)" for "([^"]*)"$/ do |link, title|
	within(:xpath, "//tr/td[text()='#{title}']") do |scope| 
		scope.click_link(link)
	end
end


When /^(?:|I )fill "([^"]*)" with "([^"]*)"$/ do |field, value|
  article = Article.where(:title => value).first
  fill_in(field, :with => article.id)
end
