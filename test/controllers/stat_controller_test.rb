require 'test_helper'

class StatControllerTest < ActionDispatch::IntegrationTest
  test "should get weekly_vote_records" do
    get stat_weekly_vote_records_url
    assert_response :success
  end

  test "should get visitors_count" do
    get stat_visitors_count_url
    assert_response :success
  end

end
