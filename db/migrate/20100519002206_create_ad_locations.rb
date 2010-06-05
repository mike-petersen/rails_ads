class CreateAdLocations < ActiveRecord::Migration
	def self.up
		create_table :ad_locations do |t|
			t.integer :ad_id
			t.string :location
		end

		add_index "ad_locations", ["ad_id"], :name => "ad_locations_ad_id_idx"
		add_index "ad_locations", ["location"], :name => "ad_locations_location_idx"
	end

	def self.down
		drop_table :ad_locations
	end
end
