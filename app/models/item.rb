class Item < ApplicationRecord

  belongs_to :user

  with_options presence: true
    validates :user#, foreign_key: true            
    validates :name            
    validates :description     
    validates :category_id     
    validates :item_state_id   
    validates :shipping_fee_id 
    validates :shipping_from_id
    validates :shipping_time_id
    validates :price           
  end
end
