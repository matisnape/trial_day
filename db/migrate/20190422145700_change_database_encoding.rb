class ChangeDatabaseEncoding < ActiveRecord::Migration[5.2]
  def up
    execute "ALTER DATABASE #{current_database} DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_bin"
    execute "ALTER TABLE `payments` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
