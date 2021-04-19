class Song < ActiveRecord::Base
    belongs_to :user

    validates :name, :artist, :genre, presence: true
    validates :name, uniqueness: true
end 