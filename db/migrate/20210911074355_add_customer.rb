class AddCustomer < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.date :date_of_birth, null: false

      t.references :import, index: true, foreign_key: true
    end
  end
end

