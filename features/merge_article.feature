Feature: Merge Articles
  As a blog administrator
  In order to bring blogs together
  I want to be able to merge articles 

  Background:
    Given the blog is set up
		And there is a publisher "publisher1"
    
	Scenario: Successfully merge articles
		Given I am logged into the admin panel
		And there is an article "My important article" with text "Text 1"
		And there is an article "My other important article" with text "Text 2"
		When I go to the edit article page for "My important article"
		Then I should see "Merge Articles"
		When I fill "merge_with" with "My other important article"
		And I press "Merge"
		#Then I should see "My important article"
		And I should see "Text 1 Text 2" 

	Scenario: Non Admin cannot merge articles
		Given there is a publisher logged into the admin panel as "publisher1"
		And there is an article "My article" with text "Text 3"
		When I go to the edit article page for "My article"
		Then I should not see "Merge Articles"