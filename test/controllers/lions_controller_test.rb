require 'test_helper'

class LionsControllerTest < ActionController::TestCase
  setup do
    @lion = lions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lion" do
    assert_difference('Lion.count') do
      post :create, lion: { about: @lion.about, birthdate: @lion.birthdate, health: @lion.health, health_notes: @lion.health_notes, name: @lion.name, weight: @lion.weight }
    end

    assert_redirected_to lion_path(assigns(:lion))
  end

  test "should show lion" do
    get :show, id: @lion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lion
    assert_response :success
  end

  test "should update lion" do
    patch :update, id: @lion, lion: { about: @lion.about, birthdate: @lion.birthdate, health: @lion.health, health_notes: @lion.health_notes, name: @lion.name, weight: @lion.weight }
    assert_redirected_to lion_path(assigns(:lion))
  end

  test "should destroy lion" do
    assert_difference('Lion.count', -1) do
      delete :destroy, id: @lion
    end

    assert_redirected_to lions_path
  end
end
