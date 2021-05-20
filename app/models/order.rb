class Order < ApplicationRecord
  belongs_to :sold_users_item
  attr_accessor :token, :price
  validates :token, presence: true
end
