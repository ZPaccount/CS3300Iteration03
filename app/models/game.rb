class Game < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :rating, presence: true
    validates :playTime, presence: true
end
