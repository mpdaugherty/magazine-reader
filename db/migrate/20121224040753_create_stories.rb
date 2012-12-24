class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :author
      t.string :link
      t.date :published_at
      t.text :text
      t.references :magazine

      t.timestamps
    end
    add_index :stories, :magazine_id
  end
end
