class AdventureMigration < ActiveRecord::Migration
 def up
   drop_table :adventure if table_exists?(:adventure)
   create_table :adventure do |t|
     t.string :name
     t.timestamps null: true
   end
 end

 def down
   drop_table :adventure if table_exists?(:adventure)
 end
end
