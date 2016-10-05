class TeacherDashboardController < ApplicationController
  include AnswersHelper
  before_action :authenticate_user!
  

  def home
  	authorize! :home, User
	  @role = current_user.roles.first.name  	
  end

  def submit_answer
  	survey = Survey.find( params[:id] )
  	@questions_by_set_count = survey.questions.count
  	@correct_answer = 0
  	Answer.all.each do |answer| 
  		if (answer.question.options.find_by(id: answer.option_id).is_correct) && (answer.user_id == current_user.id) && (answer.question.survey_id == survey.id)
        @correct_answer += 1
  		end
  	end
    respond_to do |format|
      format.js
    end
  end
end
