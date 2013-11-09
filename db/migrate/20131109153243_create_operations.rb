class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.string :url
      t.text :description
      t.references :badge

      t.timestamps
    end
    add_index :operations, :badge_id
  end
end
