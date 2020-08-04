class NotesController < ApplicationController
    def create
        @entry = Entry.find(params[:entry_id])
        @note = @entry.notes.create(params[:note].permit(:content))
        if @note.save
            redirect_to entry_path(@entry)
        else
            
        end
    end

    def show
        @note = Note.find(params[:id])
    end


    private
    def note_params(*args)
          params.require(:note).permit(*args)
    end
end
