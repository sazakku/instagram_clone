json.extract! comment, :id, :body, :post_id, :profile_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
