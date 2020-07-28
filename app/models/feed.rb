class Feed < ApplicationRecord
    has_many :entries
    require 'feedjira'
    require 'httparty'
    
    def self.update_from_feed
            url = "http://ournextlife.com/feed"
            xml = HTTParty.get(url).body
            feed = Feedjira.parse(xml)
    end

    #def self.create_entries
    #    feed.entries.each do |entry|
    #        binding.pry
    #        entry = Entry.create!(
    #            :title => entry.title, 
    #            :author => entry.author, 
    #            :url => entry.url, 
    #            :published => entry.published,
    #           :id => entry.id,
    #           :content => entry.content)
    #    end
    #end
end
