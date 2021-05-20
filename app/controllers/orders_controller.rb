class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :ordered_item, only: [:index]
  
  def index
    if current_user == @item.user
      redirect_to root_path
    else
    @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private

  def ordered_item
    if @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :address, :city, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
