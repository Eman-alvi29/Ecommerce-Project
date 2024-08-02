class PagesController < ApplicationController
  def men_fashion
    @category = Category.find_by(name: 'Male')
    @items = @category ? @category.items : []
  end

  def women_fashion
    @category = Category.find_by(name: 'Female')
    @items = @category ? @category.items : []
  end

  def all_fashion
    @items = Item.all
  end
end
