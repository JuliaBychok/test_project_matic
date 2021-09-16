class AddStatusesToImport < ActiveRecord::Migration[6.1]
  def up
    add_column :imports, :status, :string, default: 'created'

    execute <<-SQL
      CREATE TYPE import_statuses AS ENUM ('created', 'started', 'failed', 'completed')
    SQL
  end

  def down
    remove_column :imports, :status, :string

    execute <<-SQL
      DROP TYPE import_statuses
    SQL
  end
end
