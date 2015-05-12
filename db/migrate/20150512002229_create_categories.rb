class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :adventure_types
      t.timestamps
    end
  end
end
