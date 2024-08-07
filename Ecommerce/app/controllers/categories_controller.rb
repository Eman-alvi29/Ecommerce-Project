class CategoriesController < ApplicationController
  def index
    @category = params[:category]
    @items = @category.present? ? Item.where(category: @category) : Item.all
  end

  def show
    @category = params[:id]
    @items = Item.where(category: @category)
  end
end
