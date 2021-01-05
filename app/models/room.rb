class Room < ApplicationRecord
	belongs_to :room_type
	has_one :customer

	validates :room_no, :room_type, :presence => true
end
