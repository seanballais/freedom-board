class Posts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |post|
      post.integer :id, :limit => 8, null: false, unique: true
      post.string :author, null: false
      post.text :message, null: false
      post.integer :time_posted, :limit => 8, null: false
    end

    add_index :name, unique: true
  end
end
