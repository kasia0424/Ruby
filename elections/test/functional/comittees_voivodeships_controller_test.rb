require 'test_helper'

class ComitteesVoivodeshipsControllerTest < ActionController::TestCase
  setup do
    @comittees_voivodeship = comittees_voivodeships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comittees_voivodeships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comittees_voivodeship" do
    assert_difference('ComitteesVoivodeship.count') do
      post :create, comittees_voivodeship: {  }
    end

    assert_redirected_to comittees_voivodeship_path(assigns(:comittees_voivodeship))
  end

  test "should show comittees_voivodeship" do
    get :show, id: @comittees_voivodeship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comittees_voivodeship
    assert_response :success
  end

  test "should update comittees_voivodeship" do
    put :update, id: @comittees_voivodeship, comittees_voivodeship: {  }
    assert_redirected_to comittees_voivodeship_path(assigns(:comittees_voivodeship))
  end

  test "should destroy comittees_voivodeship" do
    assert_difference('ComitteesVoivodeship.count', -1) do
      delete :destroy, id: @comittees_voivodeship
    end

    assert_redirected_to comittees_voivodeships_path
  end
end
