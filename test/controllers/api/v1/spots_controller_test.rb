require 'test_helper'

class Api::V1::SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_spots_show_url
    assert_response :success
  end

end
