class ApplicationController < ActionController::Base

  def set_eatery
    @current_eatery = Eatery.find_by(id: params[:eatery_id])
  end

  def current_eatery
    @current_eatery
  end

  def set_user
    @current_user = User.find_by(id: params[:user_id])
  end

  def current_user
    @current_user
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      reviews_path
    when User
      reviews_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin, :admin, :admins
      new_admin_session_path
    when User, :user, :users
      new_user_session_path
    else
      super
    end
  end

  def layout_by_resource
    if devise_controller && resource_name == :admin
      "admins"
    elsif devise_controller && resource_name == :user
      "users"
    else
      "application"
    end
  end

  def layout_by_resource
    if devise_controller?
      "application"
    end
  end
end
