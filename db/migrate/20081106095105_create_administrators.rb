class CreateAdministrators < ActiveRecord::Migration
  def self.up
    create_table :administrators do |t|
      t.string :username
      t.integer :parent_id
      t.integer :max_clients
      t.text :description
      t.text :billing_address

      t.timestamps
    end
  end

  def self.down
    drop_table :administrators
  end
end
