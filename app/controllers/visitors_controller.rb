class VisitorsController < ApplicationController
	before_filter :authenticate_user!, only: [:admin]
	before_filter :admin_only, only: [:admin]

	def admin
		redirect_to surveys_path
	end
end
