class ActivitiesController < ApplicationController
	def index
    @activities = Activity.all		
	end

  def new
    @activity = Activity.new    
  end

  def create
    activity = Activity.new(activity_params)
    if activity.save
      render :plain => "Activity created sucessfully"
    else
      render :plain => "Error in activity creation"
    end
  end

  def show
    @activity = Activity.find_by_id(params[:id])
  end

  private
    def activity_params
      params.require(:activity).permit(:content)
    end
end
