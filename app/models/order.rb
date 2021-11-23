class Order < ApplicationRecord
  belongs_to :user
  has_many :books,:through => :purchases
  has_many :purchases, :dependent => :destroy
  validates :orderTime,:total,:shipAddress,:orderNum,:quantity, presence: true
  validates :total,:GST,:PST,:FST, :numericality => { :greater_than_or_equal_to => 0 }
end
