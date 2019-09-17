class AddActualVehicleToVehicles < ActiveRecord::Migration[5.2]
  def change
  	add_column :vehicles, :actual_vehicle, :integer 
  end
end
