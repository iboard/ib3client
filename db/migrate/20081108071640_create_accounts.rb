class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :username
      t.string :crypted_password
      t.string :fullname
      t.text :description
      t.integer :administrator_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :accounts
  end
end
