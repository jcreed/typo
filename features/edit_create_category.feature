Feature: Edit or Create a Category
  As a blog administrator
  In order to have categories
  I want to be able to create or edit a category

  Background:
    Given the blog is set up
#		And there is a publisher "publisher1"
    
	Scenario: Successfully creating or editing a category
		Given I am logged into the admin panel
#		And there is an article "My Current Article" with text "My article comment"
		When I am on the Manage Articles page
		When I follow "Categories"
		Then I should be on the new category page
		And I should see "Name"
		And I should see "Keywords"
		And I should see "Permalink"
