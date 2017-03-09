class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.datetime :last_sign_in_at

      t.timestamps
    end
  end
end
