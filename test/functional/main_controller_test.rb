require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
