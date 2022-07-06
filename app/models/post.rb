class Post < ApplicationRecord
  belongs_to :profile
  has_one_attached :image
  has_many :comment
end
