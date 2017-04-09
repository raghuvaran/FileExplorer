require 'test_helper'

class Tree2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tree2_index_url
    assert_response :success
  end

  test "should get show" do
    get tree2_show_url
    assert_response :success
  end

  test "should get download" do
    get tree2_download_url
    assert_response :success
  end

  test "should get browse" do
    get tree2_browse_url
    assert_response :success
  end

end
