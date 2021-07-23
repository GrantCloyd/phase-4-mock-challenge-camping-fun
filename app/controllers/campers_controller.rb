class CampersController < ApplicationController

    def index
        render json: Camper.all
    end

    def show 
     camper = Camper.find(params[:id])
     render json: camper, include: [:activities]
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Camper not found"}, status: 404
    end

    def create
     camper = Camper.create(campers_params)
     if camper.valid?
     render json: camper, status: 201         
     else
       render json: {errors: camper.errors.full_messages}, status: 422
     end
    end

 private

  def campers_params
   params.permit(:name, :age)
  end

end
