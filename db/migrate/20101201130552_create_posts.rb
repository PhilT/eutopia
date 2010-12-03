class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :posts_tags, :id => false do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :posts
    drop_table :tags
    drop_table :posts_tags
  end
end

