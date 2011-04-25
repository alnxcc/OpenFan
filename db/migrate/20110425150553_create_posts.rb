class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :body
      t.references :user
      t.references :topic
      t.references :node

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
