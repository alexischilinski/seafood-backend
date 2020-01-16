require 'jwt'

class AuthenticationController < ApplicationController

    def login
        username = params[:username]
        password = params[:password]

        user = User.find_by(username: username)

        if !user 
            render json: {status: :unauthorized, error: "invalid credentials"}
        else
            if !user.authenticate(password)
                render json: {status: :unauthorized, error: "invalid credentials"}
            else
                secret = Rails.application.secrets.secret_key_base
                token = JWT.encode({user_id: user.id}, secret)

                render json: {token: token, user: user}
            end
        end
    end
end
