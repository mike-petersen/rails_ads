namespace :db do
	namespace :migrate do
		description = "Migrate the database through scripts in vendor/plugins/yaffle/lib/db/migrate"
		description << "and update db/schema.rb by invoking db:schema:dump."
		description << "Target specific version with VERSION=x. Turn off output with VERBOSE=false."

		desc description
		task :rails_ads => :environment do
			ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
			ActiveRecord::Migrator.migrate("vendor/plugins/rails_ads/db/migrate/", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
			Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
		end
	end

	namespace :fixtures do
		desc "Fixtures here"
		task :rails_ads => :environment do
			require 'active_record/fixtures'
			fixture_dir = "vendor/plugins/rails_ads/test/fixtures/"
			tables = Dir["#{fixture_dir}/*.yml"]
			tables.collect! {|t| File.basename(t, '.yml')}
			Fixtures.create_fixtures(fixture_dir, tables)
		end
	end
end