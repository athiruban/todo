require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  def setup
    @default = activities(:default)
  end

  test "should show all activities" do 
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should create a new activity" do 
    get :new
    assert_response :success

    activity_params = {
      :content  => "Sample content",
      :status   => Activity::Constants::ACTIVITY_STATUS[:open],
      :priority => 3
    }

    assert_difference 'Activity.count' do 
      post :create, :activity => activity_params
    end
  end

  test "should edit the default activity" do 
    get :edit, id: @default
    assert_response :success

    activity_params = {
      :content  => @default.content,
      :status   => Activity::Constants::ACTIVITY_STATUS[:closed],
      :priority => 5      
    }

    post :update, id: @default, :activity => activity_params
    assert_response :success

    get :edit, id: @default
    assert_response :success    
  end  
end
