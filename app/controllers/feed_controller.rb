class FeedController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
  end
end