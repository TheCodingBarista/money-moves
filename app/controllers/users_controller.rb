class UsersController < ApplicationController
    def welcome
    end

    def new

    end

    def create
        
    end

    def index
    end

    private
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :name, :email)
    end
end