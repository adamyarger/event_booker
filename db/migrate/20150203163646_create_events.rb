class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.date :data
      t.string :title
      t.integer :creator_id
      t.string :location

      t.timestamps null: false
    end
  end
end
