require "test_helper"

class ImageuploadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imageupload_index_url
    assert_response :success
  end

  test "should get new" do
    get imageupload_new_url
    assert_response :success
  end

  test "should get create" do
    get imageupload_create_url
    assert_response :success
  end

  test "should get destroy" do
    get imageupload_destroy_url
    assert_response :success
  end
end
