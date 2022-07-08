class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :profile
  has_many :profile_linkables
end
