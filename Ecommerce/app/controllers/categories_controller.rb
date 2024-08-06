class CategoriesController < ApplicationController
  def index
    @category = params[:category]
    @items = if @category.present?
               Item.where(category: @category)
             else
               Item.all
             end
  end

  def show
    @category = params[:id]
    @items = Item.where(category: @category)

  end
end
