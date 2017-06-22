json.extract! bookmark, :id, :url, :shelf_id, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
