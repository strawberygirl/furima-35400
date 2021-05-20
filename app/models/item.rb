class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_time

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_state_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :shipping_time_id
    end
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end
end
