class Music < ApplicationRecord
    validates :title, presence: true
    vaildates :artist, presence: true
end
