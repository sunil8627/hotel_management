json.extract! room, :id, :room_no, :is_occupied, :room_type_id, :created_at, :updated_at
json.url room_url(room, format: :json)
