class OrderItemsController < ApplicationController
  def create
    puts "OrderItemsController#create reached"
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    puts "Order: #{@order.inspect}"
    puts "OrderItem: #{@order_item.inspect}"

    if @order.save
      puts "Order saved successfully"
      redirect_to cart_path, notice: 'Item added to cart.'
    else
      puts "Order not saved: #{@order.errors.full_messages}"
      render 'items/show'
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to order_path(@order_item.order), notice: 'Item removed successfully.'
  end

  private
  def order_item_params
    params.permit(:item_id, :quantity)
  end

  def current_order
    @current_order ||= Order.find_or_create_by(user: current_user, completed: false)
  end
end
