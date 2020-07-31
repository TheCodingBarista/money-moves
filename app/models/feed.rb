class Feed < ApplicationRecord
    has_many :entries
    require 'feedjira'
    require 'httparty'

    def self.parse_feeds
        parsed_feeds =[]
        @feeds = self.all
        @feeds.each do |f|
            url = f.url
            xml = HTTParty.get(url).body
            feed = Feedjira.parse(xml)
            parsed_feeds << feed
        end
        parsed_feeds
    end

    def self.create_entries
        parse_feeds.each do |feed|
            first_two = feed.entries[0..1]
            first_two.each do |entry|
                entry = Entry.create!(
                    :title => entry.title, 
                    :author => entry.author, 
                    :url => entry.url, 
                    :published => entry.published,
                    :content => entry.content
                )
            end
        end
    end
end
