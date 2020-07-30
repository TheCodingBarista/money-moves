class Feed < ApplicationRecord
    has_many :entries
    require 'feedjira'
    require 'httparty'


end
