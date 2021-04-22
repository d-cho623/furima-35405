class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @order_address.save
  end

  
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: item_id)
  end
end
