class StepMigration < ActiveRecord::Migration
 def up
   drop_table :step if table_exists?(:step)
   create_table :step do |t|
     t.string :text
     t.boolean :is_last
     t.string :option_a_text
     t.number :option_a_step_id
     t.string :option_b_text
     t.number :option_b_step_id
     t.number :adventure_id
     t.timestamps null: true
   end
 end

 def down
   drop_table :step if table_exists?(:step)
 end
end
