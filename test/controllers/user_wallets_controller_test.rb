require 'test_helper'

class UserWalletsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_wallets_create_url
    assert_response :success
  end

end
