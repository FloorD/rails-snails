require 'test_helper'

class SnailsControllerTest < ActionController::TestCase
  setup do
    @snail = snails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snail" do
    assert_difference('Snail.count') do
      post :create, snail: { description: @snail.description, endurance: @snail.endurance, motivation: @snail.motivation, name: @snail.name, speed: @snail.speed }
    end

    assert_redirected_to snail_path(assigns(:snail))
  end

  test "should show snail" do
    get :show, id: @snail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @snail
    assert_response :success
  end

  test "should update snail" do
    patch :update, id: @snail, snail: { description: @snail.description, endurance: @snail.endurance, motivation: @snail.motivation, name: @snail.name, speed: @snail.speed }
    assert_redirected_to snail_path(assigns(:snail))
  end

  test "should destroy snail" do
    assert_difference('Snail.count', -1) do
      delete :destroy, id: @snail
    end

    assert_redirected_to snails_path
  end
end
