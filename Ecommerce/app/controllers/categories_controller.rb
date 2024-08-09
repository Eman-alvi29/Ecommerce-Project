class CategoriesController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  def show
    @category = Category.find(params[:id])
    @q = @category.items.ransack(params[:q])
    @items = @q.result(distinct: true)
  end
end
