class ProfileLinkable < ApplicationRecord
  belongs_to :profile
  belongs_to :profile_linkable_external, polymorphic: true

  enum kind: %i[like follower]

  # validates :profile_id, :profile_linkable_external_id, uniqueness: { scope: :profile }
end
