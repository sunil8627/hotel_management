class Customer < ApplicationRecord
	belongs_to :room
	validates_presence_of :name, :age
end
