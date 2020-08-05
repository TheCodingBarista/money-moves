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
  def entry_params
		params.require(:entry).permit(:title, :content, :published, :url, :author, :summary)
	end
end