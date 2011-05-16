class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter, :string
    add_column :users, :website, :string
    add_column :users, :location, :string
    add_column :users, :description, :text
  end

  def self.down
    remove_column :users, :description
    remove_column :users, :location
    remove_column :users, :website
    remove_column :users, :twitter
  end
end
