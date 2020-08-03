module FeedHelper
    def published(entry)
        entry.published.strftime("Published %A, %b %e, at %l:%M %p")
    end
end
