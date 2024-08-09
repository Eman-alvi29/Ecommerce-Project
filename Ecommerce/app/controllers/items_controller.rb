class ItemsController < ApplicationController
  before_action :set_ransack_search, only: [:index, :show]

  def index
    @items = @q.result(distinct: true)
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def set_ransack_search
    @q = Item.ransack(params[:q])
  end
end
