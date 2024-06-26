class ActivitiesController < ApplicationController

  def create
    @activity = Activity.new
    @activity["contact_id"] = params["contact_id"]
    @activity["activity_type"] = params["activity_type"]
    @activity["note"] = params["note"]
    @activity.save
    redirect_to "/contacts/#{@activity["contact_id"]}"

    @current_user = User.find_by({ "id" => session["user_id"] })
  end

end
