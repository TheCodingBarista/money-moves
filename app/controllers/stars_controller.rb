class StarsController < ApplicationController
    respond_to :js
    
    def star
        @user = current_user
        @entry = Entry.find(params[:entry_id])
        @user.star!(@entry)
    end

    def unstar
        @user = current_user
        @star = @user.stars.find_by_entry_id(params[:entry_id])
        @entry = Entry.find(params[:entry_id])
        @star.destroy!
    end
end
