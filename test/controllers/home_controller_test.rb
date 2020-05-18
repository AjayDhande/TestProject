require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get upload_image" do
    get home_upload_image_url
    assert_response :success
  end

end
