# -*- encoding : utf-8 -*-
class AdsController < ApplicationController
	before_filter :check_admin_allowed
	layout 'ads'

	# GET /ads
	# GET /ads.xml
	def index
		@ads = Ad.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @ads }
		end
	end

	# GET /ads/1
	# GET /ads/1.xml
	def show
		@ad = Ad.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @ad }
		end
	end

	# GET /ads/new
	# GET /ads/new.xml
	def new
		@ad = Ad.new
		@ad.ad_locations.build

		render :action => 'edit'
	end

	# GET /ads/1/edit
	def edit
		@ad = Ad.find(params[:id])
		@ad.ad_locations.build
	end

	# POST /ads
	# POST /ads.xml
	def create
		@ad = Ad.new(params[:ad])
		@ad.ad_locations.build

		respond_to do |format|
			if @ad.save
				flash[:notice] = 'Ad was successfully created.'
				format.html { redirect_to(@ad) }
				format.xml  { render :xml => @ad, :status => :created, :location => @ad }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /ads/1
	# PUT /ads/1.xml
	def update
		@ad = Ad.find(params[:id])
		@ad.ad_locations.build

		respond_to do |format|
			if @ad.update_attributes(params[:ad])
				flash[:notice] = 'Ad was successfully updated.'
				format.html { redirect_to(@ad) }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /ads/1
	# DELETE /ads/1.xml
	def destroy
		@ad = Ad.find(params[:id])
		@ad.destroy

		respond_to do |format|
			format.html { redirect_to(ads_url) }
			format.xml  { head :ok }
		end
	end
end
