class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :lat
      t.string :long
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end
end
