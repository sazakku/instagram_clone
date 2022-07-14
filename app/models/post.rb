class Post < ApplicationRecord
  belongs_to :profile
  has_one_attached :image
  has_many :comments
  has_many :profile_linkables
  has_many :profile_linkables_likes, through: :profile_linkables, source: :profile_linkable_external,
           source_type: Post.name


  def like?(current_profile, post_id)
    !!Profile.find(current_profile).profile_linkables.find do |follow|
      follow.kind == "like" && follow.profile_id == current_profile && follow.profile_linkable_external_id == post_id
    end
  end

  def count_like(post_id)
    ProfileLinkable.select do |follow|
      follow.kind == "like" && follow.profile_linkable_external.id == post_id
    end.count
  end
end