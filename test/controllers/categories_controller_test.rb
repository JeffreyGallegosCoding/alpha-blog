require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Use create instead of new because you want it to actually hit the table
    @category = Category.create(name: "Sports")
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    # See a change in the number of categories once a category is created
    assert_difference('Category.count', 1) do
      # Create the category with name Travel
      post categories_url, params: { category: { name: "Travel" } }
    end
    # See if it redirects to the url category of the last category created - Travel
    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end
  #
  #   assert_redirected_to categories_url
  # end
end
