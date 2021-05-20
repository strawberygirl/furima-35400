class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  #with_options presence: true do
  #  validates :order_id
  #  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  #  prefecture_id = prefecture_id
  #  validates :prefecture_id, numericality: { other_than: 1 }
  #  validates :city
  #  validates :address
  #  validates :phone_number
  #end
  #validates :building_name
end
