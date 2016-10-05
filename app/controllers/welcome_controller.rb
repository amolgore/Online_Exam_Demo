class WelcomeController < ApplicationController
	before_action :authenticate_user!

  def index

   if user_signed_in?
     if current_user.has_role? "teacher"
       redirect_to teacher_dashboard_path     
     else
      redirect_to student_dashboard_path
     end
   else
    redirect_to root_path
   end
 end

end
