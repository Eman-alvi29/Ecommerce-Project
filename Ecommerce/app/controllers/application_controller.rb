class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to the login page
  end

   allow_browser versions: :modern
end
