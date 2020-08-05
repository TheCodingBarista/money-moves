class Entry < ApplicationRecord
    has_many :stars, dependent: :destroy
    has_many :users, through: :stars
    has_many :notes, dependent: :destroy
    
    require 'feedjira'
    require 'httparty'

    def self.create_entries
        @feeds = Feed.all
        @feeds.each do |feed|
            url = feed.url
            xml = HTTParty.get(url).body
            feed = Feedjira.parse(xml)
            first_three = feed.entries[0..2]
            first_three.each do |entry|
                entry = Entry.create!(
                    :title => entry.title, 
                    :author => entry.author, 
                    :url => entry.url, 
                    :published => entry.published,
                    :summary => entry.summary,
                    :content => entry.content
                )
            end
        end
    end
end
