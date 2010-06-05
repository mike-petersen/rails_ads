class AdViewsController < ApplicationController
	before_filter :check_admin_allowed
	layout 'ads'

	# GET /ad_views
	# GET /ad_views.xml
	def index
		@ad_views = AdView.all

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
