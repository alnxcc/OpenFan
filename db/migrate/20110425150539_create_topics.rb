class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.references :user
      t.references :node

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
