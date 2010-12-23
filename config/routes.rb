Rails.application.routes.draw do |map|
	resources :ad_views
	resources :ads
	resources :advertisers
end