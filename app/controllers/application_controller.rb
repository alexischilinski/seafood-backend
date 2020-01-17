class ApplicationController < ActionController::API
    def authenticate
        if !request.headers[:authorization]
            render json: {error: "must be logged in"}, status: :unauthorized
        else
            token = request.headers[:authorization].split(" ")[1]
            secret = Rails.application.secrets.secret_key_base
            decoded_token = JWT.decode(token, secret)[0]
            @user = User.find(decoded_token["user_id"])
            if !@user 
                render json: {error: "must be logged in"}, status: :unauthorized
            end
        end
    end
end
