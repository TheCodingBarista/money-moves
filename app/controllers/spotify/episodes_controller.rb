class Spotify::EpisodesController < ApplicationController
  def self.search
    url = "https://api.spotify.com/v1/search?q=personal+finance&type=episode"
    response = HTTParty.get(url)
    response.parsed_response
    binding.pry
  end

  def index
  end

  def show
    @episode = RSpotify::Episode.find(params[:episode_name])

  end

end
