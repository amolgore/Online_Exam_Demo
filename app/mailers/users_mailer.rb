class UsersMailer < ActionMailer::Base
    default :from => "yuvasoftest@gmail.com"

 def survey_email(student_email, survey_name)
    @survey_name = survey_name
    mail(:to => student_email, :subject => "Survey created ")
 end

end
