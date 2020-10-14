require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  # Create the two categories you will be testing with
  def setup
    @category = Category.create(name: "Sports")
    @category2= Category.create(name: "Travel")
  end

  # Creating two categories and make sure they show up on the listing page
  test "should show categories listing" do
    get '/categories'
    # This will look to match a specific link that match the urls generated by the category's path
    # and also match the text with the category name because that is what will display
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end

end
