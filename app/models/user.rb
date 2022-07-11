class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :posts, through: :profile, class_name: Post.name
  has_many :comments, through: :profile, class_name: Comment.name
  has_many :follower_posts, through: :profile, source: :profile_linkables_follower_posts, class_name: Post.name
  has_many :profile_linkables, through: :profile

  def all_post
    posts + follower_posts
  end

end
