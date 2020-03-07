class SightingsController < ApplicationController
    def index
        sightings = Sighting.all 
        render json: sightings 
    end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(:include => {
            :bird => {:except => [:created_at, :updated_at]},
            :location => {:except => [:created_at, :updated_at]}
            },
            :except => [:updated_at])
        else 
            render json: {message: "No sighting with that ID"}
        end
    end
end
