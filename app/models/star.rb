class Star < ApplicationRecordbelongs
    belongs_to :entry
    belongs_to :user

    validates :user_id, uniqueness: { scope: :entry_id }
end
