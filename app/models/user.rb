class User < ApplicationRecord
  belongs_to :province
  has_many :orders
  validates :userbane,:password,:shipAddress, presence: true
end
