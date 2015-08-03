require 'test_helper'

class CatToysControllerTest < ActionController::TestCase
  setup do
    @cat_toy = cat_toys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_toys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_toy" do
    assert_difference('CatToy.count') do
      post :create, cat_toy: { name: @cat_toy.name }
    end

    assert_redirected_to cat_toy_path(assigns(:cat_toy))
  end

  test "should show cat_toy" do
    get :show, id: @cat_toy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_toy
    assert_response :success
  end

  test "should update cat_toy" do
    patch :update, id: @cat_toy, cat_toy: { name: @cat_toy.name }
    assert_redirected_to cat_toy_path(assigns(:cat_toy))
  end

  test "should destroy cat_toy" do
    assert_difference('CatToy.count', -1) do
      delete :destroy, id: @cat_toy
    end

    assert_redirected_to cat_toys_path
  end
end
