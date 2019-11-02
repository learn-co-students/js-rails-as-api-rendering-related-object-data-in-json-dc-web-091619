class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        # render json: { 
        #     id: sighting.id, 
        #     bird: sighting.bird,
        #     location: sighting.location
        # } 
        # could also use include, indicates what models i want to nest.
        if sighting
            # render json: sighting, include: [:bird, :location]
            render json: sighting.to_json(:include => {:bird => {:only => [:name,:species]}, :location=> {:only => [:latitude, :longitude]}},:except => [:created_at, :updated_at]) 
            #limits the nested attributes too.
        else
            render json: {message: "No sighting found with that id"}
        end

    end
    
end
