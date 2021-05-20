class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_from

  with_options presence: true do
    validates :order_id
    validates :postal_code
    prefecture_id = shipping_from_id
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
  end
  validates :building_name
end
