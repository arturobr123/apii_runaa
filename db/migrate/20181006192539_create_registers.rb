class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.references :user, foreign_key: true
      t.references :day, foreign_key: true
      t.time :entry
      t.time :exit

      t.timestamps
    end
    #add_index :registers, [:user, :day], unique: true
  end
end
