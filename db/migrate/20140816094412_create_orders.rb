class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :pickup_location
      t.string :destination
      t.string :send_name
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
