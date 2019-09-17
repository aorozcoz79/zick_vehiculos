class Vehicle < ApplicationRecord
	belongs_to :user
	enum actual_vehicle: ["true", "false"]
end
