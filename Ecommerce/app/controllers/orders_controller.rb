class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def add_to_cart
    @order = current_order
    @item = Item.find(params[:item_id])

    if @order && @item
      order_item = @order.order_items.find_or_initialize_by(item: @item)
      order_item.price = @item.price
      order_item.save
      redirect_to order_path(@order), notice: 'Item added to cart.'
    else
      redirect_to items_path, alert: 'Unable to add item to cart.'
    end
  end

 private
   def set_order
      @order = Order.find(params[:id])
   end

   def current_order
      if current_user
        order = current_user.orders.find_by(id: session[:order_id]) || create_new_order
        session[:order_id] = order.id
        order
      else
        flash[:alert] = 'You need to sign in before adding items to your cart.'
        redirect_to new_user_session_path and return
      end
   end

   def create_new_order
     order = current_user.orders.new(status: 'Pending')

     if order.save
        session[:order_id] = order.id
        order
     else
        Rails.logger.error("Order could not be created: #{order.errors.full_messages.join(', ')}")
        flash[:alert] = 'Order is not valid. Please try again.'
        redirect_to items_path
        nil
     end
   end
end
