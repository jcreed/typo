Feature: Merge Articles
  As a blog administrator
  In order to bring blogs together
  I want to be able to merge articles 

  Background:
    Given the blog is set up
    
	Scenario: Successfully merge articles
		Given I am logged into the admin panel
		And there is an article "My important article" with text "Text 1"
		And there is an article "My other important article"  with text "Text 2"
		When I go to the edit page for "My important article"
		Then I should see "Merge Articles"
		When I fill in the "Article ID" with "My important article"
		And I press "Merge"
		Then I should see "My important article"
		And I should see "Text 1 Text 2" 

	#Scenario: Unsuccessfully merge articles
		#Given I am logged into the admin panel as "Blogger1"
		#When I go to the edit page for "My important article"
		#Then I should not see "Merge Articles"
		