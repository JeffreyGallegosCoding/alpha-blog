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

  test "get new category form reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    # If there is an invalid submission then there should be no difference in the category count
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " " } }
    end
    # See if redirect takes you to the error messages. You test to see if the assert matches text
    # in the response html body but you use assert_select to search through elements on the page
    # in the response such as the div class of alert and the h4 class of alert-heading
    # Warning!!: If you are trying to match with an html element it can also match with any notes you have in your code
    assert_match "following", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

end
