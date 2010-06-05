class CreateAds < ActiveRecord::Migration
	def self.up
		create_table :ads do |t|
			t.string :name
			t.integer :advertiser_id
			t.text :html
			t.integer :frequency
			t.datetime :start_date
			t.datetime :end_date
			t.string :format
			t.integer :width
			t.integer :height
			t.boolean :published
			t.boolean :time_constrained
			t.timestamps
		end

		add_index "ads", ["advertiser_id"], :name => "ads_advertiser_id_idx"
		add_index "ads", ["start_date", "end_date"], :name => "ads_start_end_date_idx"
		add_index "ads", ["format"], :name => "ads_format_idx"
		add_index "ads", ["width"], :name => "ads_width_idx"
		add_index "ads", ["height"], :name => "ads_height_idx"
	end

	def self.down
		drop_table :ads
	end
end
