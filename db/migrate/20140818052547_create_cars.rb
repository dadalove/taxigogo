class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :status, :default => "available"
      t.decimal :latitude,precision: 8, scale: 5
      t.decimal :longitude,precision: 8, scale: 5
      t.timestamps
    end

    add_index :cars,[:latitude,:longitude]
  end
end
