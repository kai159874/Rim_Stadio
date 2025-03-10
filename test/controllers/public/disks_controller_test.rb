require "test_helper"

class Public::DisksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_disks_new_url
    assert_response :success
  end

  test "should get show" do
    get public_disks_show_url
    assert_response :success
  end

  test "should get index" do
    get public_disks_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_disks_edit_url
    assert_response :success
  end
end
