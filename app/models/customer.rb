class Customer < ApplicationRecord
	belongs_to :room

	validates :name, :age, :room, :ID_card_no, :presence => true
   
    after_create :update_check_in_and_mark_room_occupied


   private

	def update_check_in_and_mark_room_occupied
      selected_room = Room.find self.room_id
      selected_room.update_attribute("is_occupied", true)  
    end 
end
