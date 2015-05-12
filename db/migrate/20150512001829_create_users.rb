class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :password_hash
      t.string :email
      t.string :username
      t.string :profile_picture
      t.timestamps
    end
  end
end
