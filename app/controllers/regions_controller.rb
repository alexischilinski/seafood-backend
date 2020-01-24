class RegionsController < ApplicationController

    def index
        regions = Region.all 
        render json: regions
    end

    def create
        region = Region.create(name: params[:id])
        render json: region
    end
end
