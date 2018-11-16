class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :department, foreign_key: true, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.integer :position, null: false
      t.boolean :active, null: false, default: true
      t.timestamps

      t.index :email, unique: true
    end
  end
end
