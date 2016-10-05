class SurveysWorker
 include Sidekiq::Worker
 sidekiq_options retry: false
 
  def perform(student_emails,survey_name)
  	student_emails.each do |email|
  		UsersMailer.survey_email(email,survey_name).deliver_now
  	end
  end
end