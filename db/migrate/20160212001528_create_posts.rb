class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.date :publication_date
      t.integer :status

      t.timestamps null: false
    end
  end
end
