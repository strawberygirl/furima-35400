class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_time

  with_options presence: true do
    validates :user_id           
    validates :image#, attached: true
    validates :name            
    validates :description     
    validates :category_id,      numericality: { other_than: 1 }    
    validates :item_state_id,    numericality: { other_than: 1 }  
    validates :shipping_fee_id,  numericality: { other_than: 1 }
    validates :shipping_from_id, numericality: { other_than: 1 }
    validates :shipping_time_id, numericality: { other_than: 1 }
    validates :price,            numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  end
end