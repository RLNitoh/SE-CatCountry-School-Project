class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :postID
      t.integer :userID
      t.string :title
      t.string :content
      t.date :date
      t.boolean :isPublic
      t.integer :likes
      t.string :description

      t.timestamps
    end
  end
end
