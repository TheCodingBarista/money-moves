class AddSummaryToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :summary, :text
  end
end
