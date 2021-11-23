class Province < ApplicationRecord
  has_many :users
  validates :name,:tax,:GST,:PST,:FST, presence: true
  validates :tax,:GST,:PST,:FST, :numericality => { :greater_than_or_equal_to => 0 }
end
