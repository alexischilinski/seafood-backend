class UsersController < ApplicationController
    before_action :authenticate, only: [:show, :update]
    def index
        users = User.all 
        render json: users, include: :fishes
    end

    def show
        user = User.find(params[:id])
        render json: user, include: :fishes
    end

    def create
        @user = User.create(user_params)
        secret = Rails.application.secrets.secret_key_base
        token = JWT.encode({user_id: @user.id}, secret)
        render json: {user: @user, token: token}, status: :unauthorized
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user, include: :fishes
    end

    # def destroy
    #     user = User.find(params[:id])
    #     user.destroy
    # end

    private

    def user_params
        params.require(:user).permit([:username, :password, :region_id])
    end
end
