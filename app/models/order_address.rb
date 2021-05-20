class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :phone_number, :building_name #:order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    #validates :order_id
    validates :postal_code,      format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number
  end
  #validate :building_name

  def save
    order = Order.create(user_id: user_id, item_id: item_id) #token: params[:token]
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building_name: building_name, order_id: order.id)
  end
end