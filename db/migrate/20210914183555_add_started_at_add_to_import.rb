class AddStartedAtAddToImport < ActiveRecord::Migration[6.1]
  def change
    add_column :imports, :started_at, :timestamp
  end
end
