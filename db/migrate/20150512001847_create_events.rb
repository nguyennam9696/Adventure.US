class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :address
      t.string :lat
      t.string :long
      t.string :video
      t.timestamps
    end
  end
end
