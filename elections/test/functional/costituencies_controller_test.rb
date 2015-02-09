require 'test_helper'

class CostituenciesControllerTest < ActionController::TestCase
  setup do
    @costituency = costituencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costituencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costituency" do
    assert_difference('Costituency.count') do
      post :create, costituency: { empty_cards: @costituency.empty_cards, entitled: @costituency.entitled, given_cards: @costituency.given_cards, invalid_votes: @costituency.invalid_votes, multiple_choice: @costituency.multiple_choice, other_invalid: @costituency.other_invalid, valid_votes: @costituency.valid_votes }
    end

    assert_redirected_to costituency_path(assigns(:costituency))
  end

  test "should show costituency" do
    get :show, id: @costituency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costituency
    assert_response :success
  end

  test "should update costituency" do
    put :update, id: @costituency, costituency: { empty_cards: @costituency.empty_cards, entitled: @costituency.entitled, given_cards: @costituency.given_cards, invalid_votes: @costituency.invalid_votes, multiple_choice: @costituency.multiple_choice, other_invalid: @costituency.other_invalid, valid_votes: @costituency.valid_votes }
    assert_redirected_to costituency_path(assigns(:costituency))
  end

  test "should destroy costituency" do
    assert_difference('Costituency.count', -1) do
      delete :destroy, id: @costituency
    end

    assert_redirected_to costituencies_path
  end
end
