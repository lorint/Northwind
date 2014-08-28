class Employee < ActiveRecord::Base
  belongs_to :reports_to
  has_many :orders

  has_many :customers, -> { distinct }, through: :orders
  has_many :order_details, through: :orders
  has_many :products, -> { distinct }, through: :order_details
  has_many :categories, -> { distinct }, through: :products
end
