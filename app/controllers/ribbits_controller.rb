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

	def destroy
		@ribbit = Ribbit.find(params[:id])
		@ribbit.destroy

		respond_to do |format|
			format.html { redirect_to ribbits_url }
			format.json { head :ok }
		end
	end

	def index
		@ribbits = Ribbit.all
		@ribbit = Ribbit.new
	end
end
