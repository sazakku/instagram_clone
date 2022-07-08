class FeedController < ApplicationController
  before_action :set_post, only: %i[ show ]

  # Lista todos los posts asociados al profile
  def index
    @posts = current_user.all_post

  end
end