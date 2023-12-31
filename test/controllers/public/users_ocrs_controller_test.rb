require "test_helper"

class Public::UsersOcrsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_users_ocrs_new_url
    assert_response :success
  end
end
