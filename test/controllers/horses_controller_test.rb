require "test_helper"

class HorsesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get horses_show_url
    assert_response :success
  end

  test "should get search_results" do
    get horses_search_results_url
    assert_response :success
  end
end
