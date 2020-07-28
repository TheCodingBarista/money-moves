class CreateFeedEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_entries do |t|
      t.string :title
      t.text :content
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
