class StudentDashboardController < ApplicationController
before_action :authenticate_user!

  def home
  	unless current_user.has_role?"student"
  	 redirect_to teacher_dashboard_path
  	end
  	@role= current_user.roles.first.name
  	@surveys = Survey.all
  end

  def submit_student_answer
    @answers = Answer.find_or_create_by(question_id: params[:que], option_id: params[:ans],user_id: current_user.id)           
    @answers.save
     respond_to do |format|
        format.js   { render nothing: true }
     end
  end

  def destroy_student_answer
    answer =  Answer.find_by(option_id: params[:option_id])
    answer.destroy rescue true
    respond_to do |format|
      format.js   { render nothing: true }
    end
  end

end
