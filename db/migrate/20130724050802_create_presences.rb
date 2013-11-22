class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.text :created_by
      t.integer :value
      t.references :badge

      t.timestamps
    end
    add_index :presences, :badge_id
  end
end
