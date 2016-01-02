class ActivitiesController < ApplicationController
	def index
    @activities = Activity.all
    @item = Activity.new
	end

  def new
    @item = Activity.new    
  end

  def edit
    @activity = Activity.find_by_id(params[:id])
  end

  def create
    activity = Activity.new(activity_params)
    activity.update_attributes(:status => "open")
    if activity.save
      flash['success'] = "Activity created sucessfully"
      redirect_to activities_path
    else
      flash['danger'] = "Activity creation failed"
      redirect_to :back
    end
  end

  def update
    activity = Activity.find_by_id(params[:id])
    activity.update_attributes(:content => params[:activity][:content])
    if activity.save!
      flash['success'] = "Activity updated sucessfully"
      redirect_to activities_path
    else
      flash['danger'] = "Activity creation failed"
      redirect_to edit_activity_url(params[:id])
    end
  end

  def show
    @activity = Activity.find_by_id(params[:id])
  end

  def close
    activity = Activity.find_by_id(params[:id])
    if activity.present?
      activity.update_attributes(:status => "close")
      if activity.save!
        flash['success'] = "Activity updated"
      else
        flash['error'] = "Activity update failed"
      end
    else
      flash['danger'] = "No activity present"
    end
    redirect_to activities_path
  end

  def pending
    @activities = Activity.all.pending
  end

  def open
    activity = Activity.find_by_id(params[:id])
    if activity.present?
      activity.update_attributes(:status => "open")
      if activity.save!
        flash['success'] = "Activity updated"
      else
        flash['error'] = "Activity update failed"
      end
    else
      flash['danger'] = "No activity present"
    end
    redirect_to activities_path
  end

  private
    def activity_params
      params.require(:activity).permit(:content)
    end
end
