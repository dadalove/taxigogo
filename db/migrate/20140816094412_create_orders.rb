class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :status, :default => "pending"
      t.integer :car_id
      t.integer :user_id

      t.string :pickup_location
      t.string :destination
      t.string :send_name
      t.string :tel
      t.string :email
      t.string :recipient
      t.string :recipient_tel
      t.string :content
      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, :car_id
  end
end
