class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.time :start_time
      t.string :description
      t.string :name
      t.string :location
      t.integer :host_id

      t.timestamps
    end
  end
end
