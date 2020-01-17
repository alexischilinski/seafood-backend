class UserFishesController < ApplicationController
    before_action :authenticate, only: [:create, :destroy]

    def index
        user_fishes = UserFish.all 
        render json: user_fishes
    end
    
    def create
        user_fish = UserFish.create(user: @user, fish_id: params[:fish_id])
        render json: user_fish
    end

    def show
        user_fish = UserFish.find(params:[id])
        render json: user_fish
    end

    def destroy
        user_fish = UserFish.find(params[:id])
        user_fish.destroy
    end
end
