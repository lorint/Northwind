class Customer < ActiveRecord::Base
	has_many :orders

	has_many :employees, -> { distinct }, through: :orders
  has_many :order_details, through: :orders
  has_many :products, through: :order_details
  has_many :categories, -> { distinct }, through: :products
end
