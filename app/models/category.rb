class Category < ApplicationRecord
  has_many :classifications, :dependent => :destroy
  has_many :books ,:through => :classifications
  validates :name, presence: true
end
