class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    #@items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new#, 'error-alert': @item.errors.full_messages
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_state_id, :shipping_fee_id, :shipping_from_id, :shipping_time_id, :price).merge(user_id: current_user.id)   
  end   
end     