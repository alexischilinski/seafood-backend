class UsersController < ApplicationController
    before_action :authenticate, only: [:show]
    def index
        users = User.all 
        render json: users, include: :fishes
    end

    def show
        user = User.find(params[:id])
        render json: user, include: :fishes
    end

    def create
        user = User.create(user_params)
        render json: user, status: :created
    end

    private

    def user_params
        params.require(:user).permit([:username, :password, :region_id])
    end
end
