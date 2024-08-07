class CategoriesController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  def show
    @category = params[:id]
    @items = Item.where(category: @category)
  end
end
