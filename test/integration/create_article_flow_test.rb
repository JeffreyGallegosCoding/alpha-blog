require 'test_helper'

class CreateArticleFlowTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: "testuser", email: "testuser@example.com",
                        password: "password", admin: false)
  end


  test "get new article and create article" do
    sign_in_as(@user)
    get new_article_path
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "newarticle", description: "This is a new article" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "newarticle", response.body
  end


  test "get new article and attempt to create invalid article" do
    sign_in_as(@user)
    get new_article_path
    assert_response :success
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { title: " ", description: "This is a new article" } }
    end
    assert_match "following", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end


end
