class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :fb
      t.string :insta
      t.string :twitter
      t.string :password_digest
      t.string :handle
      t.text :bio
      t.integer :ie
      t.integer :sn
      t.integer :tf
      t.integer :pj

      t.timestamps
    end
  end
end
