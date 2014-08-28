class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :title_of_courtesy
      t.string :birth_date
      t.string :hire_date
      t.string :address
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.string :home_phone
      t.string :extension
      t.text :notes
      t.references :reports_to, index: true

      t.timestamps
    end
  end
end
