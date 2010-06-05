class CreateAdViews < ActiveRecord::Migration
	def self.up
		create_table :ad_views do |t|
			t.string :page
			t.string :user_type
			t.integer :ad_id
			t.integer :advertiser_id
			t.string :location
			t.string :format
			t.integer :width
			t.integer :height
			t.boolean :ad_displayed
			t.timestamps
		end

		add_index "ad_views", ["advertiser_id"], :name => "ad_views_advertiser_id_idx"
		add_index "ad_views", ["page"], :name => "ad_views_page_idx"
		add_index "ad_views", ["format"], :name => "ad_views_format_idx"
		add_index "ad_views", ["width"], :name => "ad_views_width_idx"
		add_index "ad_views", ["height"], :name => "ad_views_height_idx"
		add_index "ad_views", ["ad_displayed"], :name => "ad_views_ad_displayed_idx"
	end

	def self.down
		drop_table :ad_views
	end
end
