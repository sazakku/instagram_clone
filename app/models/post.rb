class Post < ApplicationRecord
  belongs_to :profile
  has_one_attached :image
  has_many :comment
  has_many :profile_linkables
end
