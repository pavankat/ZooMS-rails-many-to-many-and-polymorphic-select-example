require 'test_helper'

class LionTamersControllerTest < ActionController::TestCase
  setup do
    @lion_tamer = lion_tamers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lion_tamers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lion_tamer" do
    assert_difference('LionTamer.count') do
      post :create, lion_tamer: { experience: @lion_tamer.experience, living: @lion_tamer.living, name: @lion_tamer.name }
    end

    assert_redirected_to lion_tamer_path(assigns(:lion_tamer))
  end

  test "should show lion_tamer" do
    get :show, id: @lion_tamer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lion_tamer
    assert_response :success
  end

  test "should update lion_tamer" do
    patch :update, id: @lion_tamer, lion_tamer: { experience: @lion_tamer.experience, living: @lion_tamer.living, name: @lion_tamer.name }
    assert_redirected_to lion_tamer_path(assigns(:lion_tamer))
  end

  test "should destroy lion_tamer" do
    assert_difference('LionTamer.count', -1) do
      delete :destroy, id: @lion_tamer
    end

    assert_redirected_to lion_tamers_path
  end
end
