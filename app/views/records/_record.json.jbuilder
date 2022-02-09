json.extract! record, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url record_url(record, format: :json)
