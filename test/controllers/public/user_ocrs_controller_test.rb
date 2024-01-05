require "test_helper"

class Public::UserOcrsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_user_ocrs_new_url
    assert_response :success
  end
end
