require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  test "should get index" do 
    get :index
    assert_respones :success
    assert_not_nil assigns(:activities)
  end
end
