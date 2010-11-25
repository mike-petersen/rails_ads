# -*- encoding : utf-8 -*-
class Ad < ActiveRecord::Base
	has_many   :ad_locations
	has_many   :ad_views
	belongs_to :advertiser, :foreign_key => :advertiser_id

	accepts_nested_attributes_for :ad_locations, :allow_destroy => true, :reject_if => proc { |attributes| attributes['location'].blank? }

	def self.find_ad(options = {}, logged_in = false, page = '')
		space      = options[:space]
		space      = 'all' if space.nil?
		conditions = ["(time_constrained = ? OR (start_date <= ? AND end_date >= ?))", "(location = ? OR location = ?)", "published = ?"]
		params     = [false, Time.now, Time.now, 'all', space, true]
		joins      = "JOIN ad_locations ON (ads.id = ad_locations.ad_id)"

		conditions << "width = ?" if options[:width]
		params << options[:width] if options[:width]

		conditions << "width <= ?" if options[:max_width]
		params << options[:max_width] if options[:max_width]

		conditions << "height = ?" if options[:height]
		params << options[:height] if options[:height]

		conditions << "height <= ?" if options[:max_height]
		params << options[:max_height] if options[:max_height]

		conditions << "format = ?" if options[:format]
		params << options[:format] if options[:format]

		# Build conditions
		conditions = [conditions.join(' AND '), params].flatten
		ad         = Ad.find(:first, :conditions => conditions, :joins => joins)

		# View zählen
		adview                  = AdView.new
		if ad then
			adview.ad_id         = ad.id
			adview.advertiser_id = ad.advertiser_id
			adview.width         = ad.width
			adview.height        = ad.height
			adview.format        = ad.format
			adview.ad_displayed  = true
		else
			adview.width         = options[:width]
			adview.height        = options[:height]
			adview.format        = options[:format]
			adview.ad_displayed  = false
		end
		adview.page             = page
		adview.location         = options[:space]
		adview.user_type        = logged_in ? 'logged_in' : 'anonymous'
		adview.save

		return ad
	end
end
