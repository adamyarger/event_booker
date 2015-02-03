class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :attendee_id
      t.integer :attendee_event_id

      t.timestamps null: false
    end
  end
end
