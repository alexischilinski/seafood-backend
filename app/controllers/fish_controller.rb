class FishController < ApplicationController

    def index
        fishes = Fish.all 
        render json: fishes
    end

    def show
        fish = Fish.find(params[:id])
        render json: fish
    end

    def destroy
        fish = Fish.find(params[:id])
        fish.destroy 
    end
end
