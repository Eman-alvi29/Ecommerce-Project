class PaymentsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @payment = @order.build_payment
  end

  def create
    @order = Order.find(params[:order_id])
    @payment = @order.build_payment(payment_params)

    ActiveRecord::Base.transaction do
      if @payment.save
        @order.update!(status: :completed)
        redirect_to root_path, notice: 'Order completed successfully.'
      else
        flash[:alert] = 'Order failed.'
        render :new
      end
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:amount, :card_number, :expiry_date, :cvv)
    end
end
