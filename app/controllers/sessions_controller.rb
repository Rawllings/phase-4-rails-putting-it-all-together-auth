class SessionsController < ApplicationController
    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
        else
            render json: {errors: ["Invalid username or password"]}, status: 401
        end
    end

    def destroy
        if session.include? :user_id
            session.delete :user_id
            head :no_content
        else
            render json: {errors: ["Unauthorized"]}, status: :unauthorized
        end
    end
    
end
