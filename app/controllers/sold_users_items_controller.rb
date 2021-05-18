class SoldUsersItemsController < ApplicationController
  def create
    @sold_users_item = SoldUsersItem.new(sold_users_item_params)
  end

  private

  def sold_users_item_params
    params.require(:sold_users_item).merge(user_id: params[:user_id], item_id: params[:item_id])
  end
end
