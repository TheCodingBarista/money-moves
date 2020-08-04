class RemoveFeedIdFromEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :feed_id, :integer
  end
end
