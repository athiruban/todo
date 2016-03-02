require 'test_helper'

class CreateActivityTest < ActionDispatch::IntegrationTest
  test "should create a new activity" do
    a = Activity.new({
    	:content => "Need to complete rails tutorial"
    	})
    assert a.save
  end

  test "should show the activities list in descending order" do
  	get "activities#index"
  	assert_response :success
  end
end
