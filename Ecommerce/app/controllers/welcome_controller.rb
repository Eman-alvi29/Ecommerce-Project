class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
   @q = Item.ransack(params[:q])
 end
end
