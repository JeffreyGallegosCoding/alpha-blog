require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  # Tests the behavior you would like the application to follow when creating a category
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Sports" } }
      assert_response :redirect
    end
    # Follow the redirect and see where it takes us
    follow_redirect!
    assert_response :success
    # See if redirect takes you to the correct show page. Finding it by the name in the html body.
    assert_match "Sports", response.body
  end
end
