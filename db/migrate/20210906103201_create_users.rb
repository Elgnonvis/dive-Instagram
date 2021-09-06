class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :username
      t.string :avatar
      t.string :password
      t.string :password_confirmation
      t.string :password_digest

      t.timestamps
    end
  end
end
