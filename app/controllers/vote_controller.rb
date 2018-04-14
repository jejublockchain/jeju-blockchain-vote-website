class VoteController < ApplicationController
  def new
		@candidates = Candidate.all
  end
	
	def create
		@user = current_user
		@candidate = Candidate.find(params[:candidate_id])
		@vote_record = VoteRecord.new(user: @user, candidate: @candidate)
		
		if @vote_record.save
      respond_to do |format|
        format.js
      end
    else

    end
	end
end
