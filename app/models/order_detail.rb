class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

	has_one :customer, through: :order
	has_one :employee, through: :order
	has_one :category, through: :product
end
