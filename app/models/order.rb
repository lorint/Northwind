class Order < ActiveRecord::Base
  # belongs_to :ship_via, class_name: "Shipper", foreign_key: :ship_via_id, inverse_of: :orders
  belongs_to :customer
  belongs_to :employee

  has_many :order_details
end
