class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_time

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :user#, foreign_key: true            
    validates :name            
    validates :description     
    validates :category_id,      numericality: { other_than: 1 }    
    validates :item_state_id,    numericality: { other_than: 1 }  
    validates :shipping_fee_id,  numericality: { other_than: 1 }
    validates :shipping_from_id, numericality: { other_than: 1 }
    validates :shipping_time_id, numericality: { other_than: 1 }
    validates :price           
  end
end