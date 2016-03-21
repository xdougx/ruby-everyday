class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :status
      t.string :token
      t.string :password
      t.string :password_hash
      t.string :password_recover
      t.text :resume

      t.timestamps null: false
    end
  end
end
