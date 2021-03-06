class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :redirect_user, only: [:edit, :update, :destroy]
  before_action :ordered_item, except: [:index, :create, :show, :new]
  
  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit  
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_state_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_user
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def ordered_item
    redirect_to root_path if @item.order.present?
  end
end
