class EmployeeReport
  include ActiveModel::AttributeMethods

  define_attribute_methods :first_name, :last_name, :amount
  attr_accessor :first_name, :last_name, :amount

  def attributes
    { 'first_name' => @first_name, 'last_name' => @last_name, 'amount' => @amount }
  end
end