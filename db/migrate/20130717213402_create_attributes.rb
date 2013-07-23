class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name
      t.text :description
      t.integer :atype
      t.string :value
      t.references :resource

      t.timestamps
    end
    add_index :attributes, :resource_id
  end
end
