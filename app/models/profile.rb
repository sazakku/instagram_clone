class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  has_many :posts #My Posts
  has_many :profile_linkables
  has_many :profile_linkables_followers, through: :profile_linkables, source: :profile_linkable_external, source_type: Profile.name
  # follower's Posts
  has_many :profile_linkables_follower_posts, through: :profile_linkables_followers, source: :posts, class_name: Post.name
end
