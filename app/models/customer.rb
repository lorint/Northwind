class Customer < ActiveRecord::Base
	has_many :orders

	# Show all the employees this customer has ever bought from
	# but don't show any duplicates!
	has_many :employees, -> { distinct }, through: :orders
  has_many :order_details, through: :orders
  has_many :products, -> { distinct }, through: :order_details
  has_many :categories, -> { distinct }, through: :products
end
