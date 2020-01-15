class UserFishesController < ApplicationController

    def create
        user_fish = UserFish.create(user: params[:user], fish: params[:fish])
        render json: user_fish
    end
end
