require 'test_helper'

class TreeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tree_show_url
    assert_response :success
  end

  test "should get download" do
    get tree_download_url
    assert_response :success
  end

  test "should get browse" do
    get tree_browse_url
    assert_response :success
  end

end
