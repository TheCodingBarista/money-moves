class NotesController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @note = Note.new(user_id: current_user.id, entry_id: params[:entry_id])
    end

    def index
        @entry = Entry.find(params[:entry_id])
        @notes = @entry.notes
    end
    
    def create
        @user = current_user
        @note = Note.new(note_params)
        @note.entry_id = params[:entry_id]
        @note.user_id = @user.id
        if @note.save
            redirect_to entry_notes_path(@note.entry)
        else
            render :new
        end
    end

    def edit
        @entry = Entry.find(params[:entry_id])
        @note = @entry.notes.find(params[:id])    
    end

    def update
        @entry = Entry.find(params[:entry_id])
        @user = current_user
        @note = @entry.notes.find(params[:id])
        if @note.user_id == @user.id
            @note.update(note_params)
            redirect_to entry_path(@note.entry)
        else
            redirect_to entries_path
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
          params.require(:note).permit(:entry_id, :user_id, :title, :content)
    end
end
