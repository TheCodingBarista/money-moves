class Star < ApplicationRecord
    belongs_to :entry, counter_cache: true
    belongs_to :user

    validates :user_id, uniqueness: { scope: :entry_id }
end
