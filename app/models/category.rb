class Category < ActiveRecord::Base
	has_many :products
	has_many :order_details, through: :products
	has_many :orders, through: :order_details
	has_many :customers, through: :orders
	has_many :employees, through: :orders
end
