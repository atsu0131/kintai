class CreateApprovers < ActiveRecord::Migration[5.2]
  def change
    create_table :approvers do |t|
      t.references :user, foreign_key: true, null: false
      t.references :department, foreign_key: true, null: false

      t.timestamps
      t.index [:user_id, :department_id], unique: true
    end
  end
end
