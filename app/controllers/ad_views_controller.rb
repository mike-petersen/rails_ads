class AdViewsController < ApplicationController
	unloadable
	before_filter :check_admin_allowed
	layout 'ads'

	# GET /ad_views
	# GET /ad_views.xml
	def index
		@ad_views = AdView.all(
				:select => "COUNT(*) AS views, ad_id, advertiser_id, user_type, location, page, format",
				:group => "ad_id, advertiser_id, user_type, location, page, format",
				:order => "views DESC"
			)

		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @ad_views }
		end
	end

	# GET /ad_views/1
	# GET /ad_views/1.xml
	def show
		@ad_view = AdView.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @ad_view }
		end
	end
end
