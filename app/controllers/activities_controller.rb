class ActivitiesController < ApplicationController

    def index
        render json: Activity.all
    end

    def show 

    end

    def destroy
      activity = Activity.find(params[:id])
      activity.destroy
      head :no_content
      rescue ActiveRecord::RecordNotFound
      render json: {error: "Activity not found"}, status: 404
    end
end
