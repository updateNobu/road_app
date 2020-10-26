require 'test_helper'

class RoadmapsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get roadmaps_new_url
    assert_response :success
  end

end
