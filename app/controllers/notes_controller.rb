class NotesController < ApplicationController
    def new
        @note = Note.new(entry_id: params[:entry_id])
    end
    
    def create
        #@entry = Entry.find(params[:entry_id])
        @note = Note.new(note_params)
        @note.entry_id = params[:entry_id]
        @note.save
        redirect_to entry_path(@note.entry)            
    end

    def destroy
        @entry = Entry.find(params[:entry_id])
        @note = @entry.notes.find(params[:id])
        @note.destroy
        redirect_to entry_path(@entry)
    end

    private
    def note_params
          params.require(:note).permit(:entry_id, :content)
    end
end
