class DashboardController < ApplicationController
	before_action :authenticate_user!
before_action :set_user, only: [:show, :edit, :update]

	def index
	


	end
end
