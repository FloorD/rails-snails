class CreateSnails < ActiveRecord::Migration
  def change
    create_table :snails do |t|
      t.string :name
      t.string :owner
      t.text :description
      t.integer :speed
      t.integer :endurance
      t.integer :motivation
      t.integer :win
      t.integer :lose

      t.timestamps
    end
  end
end
