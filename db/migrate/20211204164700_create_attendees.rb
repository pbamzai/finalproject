class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :rsvp

      t.timestamps
    end
  end
end
