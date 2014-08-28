class Employee < ActiveRecord::Base
  belongs_to :reports_to
  has_many :orders

  has_many :customers, through: :orders
end
