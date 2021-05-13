class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :sold_users_items

  with_options presence: true do
    validates :nickname         
    validates :email,            uniqueness: { case_sensitive: true }
    validates :password,         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers" }, length: { minimum: 6 }
    validates :family_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :kana_first_name,  format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday         
  end
end
