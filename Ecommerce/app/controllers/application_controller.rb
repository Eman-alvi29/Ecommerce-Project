class ApplicationController < ActionController::Base
  before_action :set_ransack_search

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to the login page
  end

  allow_browser versions: :modern
  private

  def set_ransack_search
    @q = Item.ransack(params[:q])
  end
end
