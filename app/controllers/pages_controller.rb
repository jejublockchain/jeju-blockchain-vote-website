class PagesController < ApplicationController
  def main
		@candidates = Candidate.all
  end
	
	def about
	end
end
