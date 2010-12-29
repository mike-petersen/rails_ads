# -*- encoding : utf-8 -*-
class CreateAdvertisers < ActiveRecord::Migration
	def self.up
		create_table :advertisers do |t|
			t.string :name
			t.timestamps
		end
	end

	def self.down
		drop_table :advertisers
	end
end
