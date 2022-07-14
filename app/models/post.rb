class Post < ApplicationRecord
  belongs_to :profile
  has_one_attached :image
  has_many :comments
  has_many :profile_linkables
  has_many :profile_linkables_likes, through: :profile_linkables, source: :profile_linkable_external,
           source_type: Post.name


  def like?(current_profile, follow_profile)
    !!Profile.find(current_profile).profile_linkables.find do |follow|
      follow.kind == "like" && follow.profile_id == current_profile && follow.profile_linkable_external.profile_id == follow_profile
    end
  end
end
