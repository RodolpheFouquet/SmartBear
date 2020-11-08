require 'test_helper'

class BearListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bear_list = bear_lists(:one)
  end

  test "should get index" do
    get bear_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_bear_list_url
    assert_response :success
  end

  test "should create bear_list" do
    assert_difference('BearList.count') do
      post bear_lists_url, params: { bear_list: { title: @bear_list.title } }
    end

    assert_redirected_to bear_list_url(BearList.last)
  end

  test "should show bear_list" do
    get bear_list_url(@bear_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_bear_list_url(@bear_list)
    assert_response :success
  end

  test "should update bear_list" do
    patch bear_list_url(@bear_list), params: { bear_list: { title: @bear_list.title } }
    assert_redirected_to bear_list_url(@bear_list)
  end

  test "should destroy bear_list" do
    assert_difference('BearList.count', -1) do
      delete bear_list_url(@bear_list)
    end

    assert_redirected_to bear_lists_url
  end
end
