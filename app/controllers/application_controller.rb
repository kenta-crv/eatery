class ApplicationController < ActionController::Base
  before_action :set_host
  before_action :set_search

  # 例外処理

   rescue_from ActiveRecord::RecordNotFound, with: :render_404 unless Rails.env.development?
   rescue_from ActionController::RoutingError, with: :render_404 unless Rails.env.development?
   rescue_from Exception, with: :render_500 unless Rails.env.development?

   def set_host
      Rails.application.routes.default_url_options[:host] = request.host_with_port
   end

   def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
   end

   def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
   end

   def set_search
     @q = Eatery.ransack(params[:q])
     @eateries = @q.result
     @eateries = @eateries.all.order(created_at: 'desc')
   end

  def set_eatery
    @current_eatery = Eatery.find_by(id: params[:eatery_id])
  end

  def current_eatery
    @current_eatery
  end

  def set_release
    @current_release = Release.find_by(id: params[:release_id])
  end

  def current_release
    @current_release
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
