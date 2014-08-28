class Product < ActiveRecord::Base
  # belongs_to :supplier
  belongs_to :category

  has_many :order_details
	has_many :orders, through: :order_details
	has_many :customers, -> { distinct }, through: :orders
	has_many :employees, -> { distinct }, through: :orders
end
