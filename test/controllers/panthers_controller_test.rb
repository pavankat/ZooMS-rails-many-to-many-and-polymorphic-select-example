require 'test_helper'

class PanthersControllerTest < ActionController::TestCase
  setup do
    @panther = panthers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:panthers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create panther" do
    assert_difference('Panther.count') do
      post :create, panther: { claw_length: @panther.claw_length, name: @panther.name }
    end

    assert_redirected_to panther_path(assigns(:panther))
  end

  test "should show panther" do
    get :show, id: @panther
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @panther
    assert_response :success
  end

  test "should update panther" do
    patch :update, id: @panther, panther: { claw_length: @panther.claw_length, name: @panther.name }
    assert_redirected_to panther_path(assigns(:panther))
  end

  test "should destroy panther" do
    assert_difference('Panther.count', -1) do
      delete :destroy, id: @panther
    end

    assert_redirected_to panthers_path
  end
end
