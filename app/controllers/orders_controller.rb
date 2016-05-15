class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Thanks for ordering LOCK IT"
      @order = Order.new
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :first_name,
      :last_name,
      :email,
      :wants_ring,
      :ring_amount,
      :wants_wallet,
      :wallet_amount,
      :note)
  end
end
