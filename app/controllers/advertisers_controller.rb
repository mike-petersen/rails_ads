class AdvertisersController < ApplicationController
	require_role 'advertisers'
	layout 'ads'

	# GET /ads
	# GET /ads.xml
	def index
		@advertisers = Advertiser.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @advertisers }
		end
	end

	# GET /ads/1
	# GET /ads/1.xml
	def show
		@advertiser = Advertiser.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @advertiser }
		end
	end

	# GET /ads/new
	# GET /ads/new.xml
	def new
		@advertiser = Advertiser.new

		render :action => 'edit'
	end

	# GET /ads/1/edit
	def edit
		@advertiser = Advertiser.find(params[:id])
	end

	# POST /ads
	# POST /ads.xml
	def create
		@advertiser = Advertiser.new(params[:advertiser])

		respond_to do |format|
			if @advertiser.save
				flash[:notice] = 'Advertiser was successfully created.'
				format.html { redirect_to(@advertiser) }
				format.xml  { render :xml => @advertiser, :status => :created, :location => @advertiser }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @advertiser.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /ads/1
	# PUT /ads/1.xml
	def update
		@advertiser = Advertiser.find(params[:id])

		respond_to do |format|
			if @advertiser.update_attributes(params[:advertiser])
				flash[:notice] = 'Advertiser was successfully updated.'
				format.html { redirect_to(@advertiser) }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @advertiser.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /ads/1
	# DELETE /ads/1.xml
	def destroy
		@advertiser = Advertiser.find(params[:id])
		@advertiser.destroy

		respond_to do |format|
			format.html { redirect_to(ads_url) }
			format.xml  { head :ok }
		end
	end
end