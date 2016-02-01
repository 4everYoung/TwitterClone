class RibbitsController < ApplicationController
	def create
		@ribbit = Ribbit.new(params[:ribbit])
		@ribbit.user_id = current_user.id
		if @ribbit.save
			redirect_to current_user
		else
			flash[:error] = 'Tweet length should not be more 140 characters!'
			redirect_to current_user
		end
	end

	def index
		@ribbits = Ribbit.all
		@ribbit = Ribbit.new
	end
end
