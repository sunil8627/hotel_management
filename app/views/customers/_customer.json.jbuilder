json.extract! customer, :id, :name, :age, :ID_card_no, :room_id, :check_in_at, :check_out_at, :created_at, :updated_at
json.url customer_url(customer, format: :json)
