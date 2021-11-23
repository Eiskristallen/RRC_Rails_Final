class Book < ApplicationRecord
  has_many :classifications, :dependent => :destroy
  has_many :categories,:through => :classifications
  has_many :orders,:through => :purchases
  has_many :purchases, :dependent => :destroy
  has_one_attached :image
  accepts_nested_attributes_for :classifications,allow_destroy: true
  validates :title,:author,:price,:quantity, presence: true
  validates :price,:quantity, :numericality => { :greater_than_or_equal_to => 0 }
end
