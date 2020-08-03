class Entry < ApplicationRecord
    has_many :stars, dependent: :destroy
    has_many :users, through: :stars
end
