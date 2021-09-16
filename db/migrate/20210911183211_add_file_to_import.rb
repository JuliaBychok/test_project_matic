class AddFileToImport < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :attachment, :string
  end
end
