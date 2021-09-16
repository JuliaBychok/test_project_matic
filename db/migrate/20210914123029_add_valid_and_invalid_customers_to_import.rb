class AddValidAndInvalidCustomersToImport < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :valid_customers, :integer, default: 0
    add_column :imports, :invalid_customers, :integer, default: 0
  end
end
