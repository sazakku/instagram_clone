json.extract! profile, :id, :nickname, :name, :description, :profile_image, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
json.profile_image url_for(profile.profile_image)
