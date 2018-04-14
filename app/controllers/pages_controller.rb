class PagesController < ApplicationController
  def main
		@candidates = Candidate.all
		addVisitCount()
		
		@total_visit_count = VisitRecord.sum(:count)
		@weekly_visit_count = VisitRecord.where('day >= ?', 1.week.ago).sum(:count)
		@today_visit_count = VisitRecord.where(day: Time.now.strftime("%Y-%m-%d")).sum(:count)
  end
	
	def about
	end
	
	
	private 
	def addVisitCount
		todayString = Time.now.strftime("%Y-%m-%d")
		todayVisit = VisitRecord.find_by_day(todayString)
		todayVisit = VisitRecord.create(day:todayString, count:0) unless todayVisit.present?
		
		todayVisit.count = todayVisit.count + 1
		todayVisit.save
	end
end
