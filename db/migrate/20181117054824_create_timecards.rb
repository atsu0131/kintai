class CreateTimecards < ActiveRecord::Migration[5.2]
  def change
    create_table :timecards do |t|
      t.references :user_id, foreign_key: true, null: false
      t.time :start_at, null: false
      t.time :end_at, null: false

      t.timestamps
    end
  end
end
