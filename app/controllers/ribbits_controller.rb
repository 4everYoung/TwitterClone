class RibbitsController < ApplicationController
	before_action :get_ribbit, :only => [:destroy]
	before_action :check_auth, :only => [:destroy]
	def create
		@ribbit = Ribbit.new(params[:ribbit])
		@ribbit.user_id = current_user.id
		if @ribbit.save
			redirect_to buddies_path
		else
			flash[:error] = 'Tweet length should not be more 140 characters!'
			redirect_to buddies_path
		end
	end

	def destroy
		@ribbit = Ribbit.find(params[:id])
		@ribbit.destroy

		respond_to do |format|
			format.js { render inline: "window.location.reload();" }
			format.json { head :ok }
		end
	end

	def index
		@ribbits = Ribbit.all
		@ribbit = Ribbit.new
	end

	def get_ribbit
		@ribbit = Ribbit.find(params[:id])
	end
	def check_auth
		if session[:user_id] != @ribbit.user_id
			flash[:error] = "Sorry, you can't delete this tweet"
			respond_to do |format|
				format.js { render inline: "window.location.reload();" }
				format.json { head :unauthorized }
				flash[:error] = "Sorry, you can't delete this tweet"
			end
		end
	end
end
