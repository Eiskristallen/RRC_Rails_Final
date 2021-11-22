class Book < ApplicationRecord
  has_many :classifications, :dependent => :destroy
  has_many :categories,:through => :classifications
  has_one_attached :image
  accepts_nested_attributes_for :classifications,allow_destroy: true
end
