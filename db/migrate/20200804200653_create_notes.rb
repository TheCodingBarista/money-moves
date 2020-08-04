class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.belongs_to :entry, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
