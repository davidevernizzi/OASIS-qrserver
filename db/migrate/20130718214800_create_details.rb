class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :kind
      t.string :value
      t.references :badge

      t.timestamps
    end
    add_index :details, :badge_id
  end
end
