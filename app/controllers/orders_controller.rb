class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  
  private

  def order_params
    params.require(:order_address).permit(:order_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, )
  end
end
