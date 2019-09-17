class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :brand
      t.string :model
      t.string :string
      t.integer :doors
      t.string :kind
      t.integer :user_id

      t.timestamps
    end
  end
end
