class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :dns_name
      t.string :ip
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
