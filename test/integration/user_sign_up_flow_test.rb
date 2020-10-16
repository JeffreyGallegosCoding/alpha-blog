require 'test_helper'

class UserSignUpFlowTest < ActionDispatch::IntegrationTest
  test "create a new user and sign them in" do
    get signup_path
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "testnewuser", email: "testnewuser@example.com", password: "password" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Listing All Articles", response.body
  end

  test "attempt to create an invalid user and sign them in" do
    get signup_path
    assert_response :success
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username: " ", email: "testnewuser@example.com", password: "password" } }
    end
    assert_match "following", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
