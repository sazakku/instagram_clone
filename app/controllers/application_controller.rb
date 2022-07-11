class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    if user_signed_in? && current_user.profile != nil
      root_path
    else
      new_profile_path
    end
  end

  def after_sign_out_path_for(resource)
    # return the path based on resource
    user_session_path
  end

  def after_sign_up_path_for(resource)
    new_profile_path
  end
end
