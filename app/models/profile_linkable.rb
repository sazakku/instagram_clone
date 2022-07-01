class ProfileLinkable < ApplicationRecord
  belongs_to :profile
  belongs_to :profile_linkable_external, polymorphic: true

  enum kind: { like: 1, follower: 2 }
end
