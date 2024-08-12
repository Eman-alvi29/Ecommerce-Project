class ApplicationController < ActionController::Base
  include Pagy::Backend

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to the login page
  end
end
