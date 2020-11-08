require 'test_helper'

class BearsControllerTest < ActionController::TestCase
  setup do
    @bear_list = bear_lists(:one)
    @bear = bears(:one)
  end

  test "should get index" do
    get :index, params: { bear_list_id: @bear_list }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { bear_list_id: @bear_list }
    assert_response :success
  end

  test "should create bear" do
    assert_difference('Bear.count') do
      post :create, params: { bear_list_id: @bear_list, bear: @bear.attributes }
    end

    assert_redirected_to bear_list_bear_path(@bear_list, Bear.last)
  end

  test "should show bear" do
    get :show, params: { bear_list_id: @bear_list, id: @bear }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { bear_list_id: @bear_list, id: @bear }
    assert_response :success
  end

  test "should update bear" do
    put :update, params: { bear_list_id: @bear_list, id: @bear, bear: @bear.attributes }
    assert_redirected_to bear_list_bear_path(@bear_list, Bear.last)
  end

  test "should destroy bear" do
    assert_difference('Bear.count', -1) do
      delete :destroy, params: { bear_list_id: @bear_list, id: @bear }
    end

    assert_redirected_to bear_list_bears_path(@bear_list)
  end
end
