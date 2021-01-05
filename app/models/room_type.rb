class RoomType < ApplicationRecord
	has_many :rooms

	validates :name, :price, :presence => true
end
