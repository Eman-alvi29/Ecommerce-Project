class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_order

  def current_order
    if user_signed_in?
      order = current_user.orders.last || create_order
      session[:order_id] = order.id
      order
    end
  end

  private

  def create_order
    current_user.orders.create(status: 'Pending')
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to the login page
  end
end
