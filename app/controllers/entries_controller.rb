class EntriesController < ApplicationController
def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
    @note = Note.new
    @note.entry_id = @entry.id
  end

  private
  def entry_params(*args)
		params.require(:entry).permit(*args)
	end
end
