class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :profile
  has_many :profile_linkables

  def like?(current_profile, comment_id)
    !!Profile.find(current_profile).profile_linkables.find do |like|
      like.kind == "like" && like.profile_id == current_profile && like.profile_linkable_external_id == comment_id
    end
  end

  def count_like(comment_id)
    ProfileLinkable.select do |follow|
      follow.kind == "like" && follow.profile_linkable_external.id == comment_id
    end.count
  end
end
