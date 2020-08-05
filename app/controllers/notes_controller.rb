class NotesController < ApplicationController
    def new
        @note = Note.new(user_id: current_user.id, entry_id: params[:entry_id])
    end
    
    def create
        #@entry = Entry.find(params[:entry_id])
        @user = current_user
        @note = Note.new(note_params)
        @note.entry_id = params[:entry_id]
        @note.user_id = @user.id
        if @note.save
            redirect_to entry_path(@note.entry)
        else
            render :new
        end
    end

    def destroy
        @entry = Entry.find(params[:entry_id])
        @note = @entry.notes.find(params[:id])
        @note.destroy
        redirect_to entry_path(@entry)
    end

    private
    def note_params
          params.require(:note).permit(:entry_id, :user_id, :content)
    end
end
