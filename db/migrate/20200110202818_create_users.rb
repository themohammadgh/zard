class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      #rails by default adds id, :id =? false at creating if don't want

      t.column "first_name", :string, :limit => 25

      #shorter version of adding a string type column
      t.string "last_name", :limit => 50
      t.string "email", :default => '', :null => false
      t.string "password", :limit => 40
      
      t.timestamps
      #short for:
      #t.datetime "created_at"
      #t.datetime "updated_at"
    end
  end

  def down
    drop_table :users
  end
end
