class ApplicationController < ActionController::Base

	rescue_from ActionController::ParameterMissing, with: :param_missing_err_handler

	def param_missing_err_handler
		redirect_to root_path
	end

end
