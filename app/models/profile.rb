class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  has_many :posts # My Posts
  has_many :comments # My comments
  has_many :profile_linkables
  has_many :profile_linkables_followers, through: :profile_linkables, source: :profile_linkable_external, source_type: Profile.name
  # follower's Posts
  has_many :profile_linkables_follower_posts, through: :profile_linkables_followers, source: :posts, class_name: Post.name
  has_many :profile_linkables_follower_comments, through: :profile_linkables_followers, source: :comments, class_name: Comment.name

  # Validation Sure They Can Only Follow it Once
  def follow?(current_profile, follow_profile)
    p "prueba"
    !!profile_linkables.find { |follow| follow.profile_id == current_profile && follow.profile_linkable_external_id == follow_profile }
  end
end
