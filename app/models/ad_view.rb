# -*- encoding : utf-8 -*-
class AdView < ActiveRecord::Base
	belongs_to :ad
	belongs_to :advertiser
	belongs_to :ad_location
end
