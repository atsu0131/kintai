class CreateTimecards < ActiveRecord::Migration[5.2]
  def change
    create_table :timecards do |t|
      t.references :user, foreign_key: true, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.timestamps
    end
  end
end
