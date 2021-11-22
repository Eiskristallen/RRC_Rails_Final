class Book < ApplicationRecord
  has_many :classifications, :dependent => :destroy
  has_many :categories,:through => :classifications
  has_one_attached :image
end
