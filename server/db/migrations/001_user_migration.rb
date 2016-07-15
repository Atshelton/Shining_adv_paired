class UserMigration < ActiveRecord::Migration
  def up
    drop_table :users if table_exists?(:users)
    create_table :users do |t|
      t.string :token
      t.timestamps null: true
    end
  end

  def down
    drop_table :users if table_exists?(:users)
  end
end
