class CreateEventAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :event_attendances do |t|
      t.references :member, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
