class User < ApplicationRecord
  belongs_to :province
  has_many :orders
  validates :username,:password,:shipAddress, presence: true
  has_secure_password
end
