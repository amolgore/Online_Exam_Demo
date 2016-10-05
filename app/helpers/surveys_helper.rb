module SurveysHelper

 def checked_answer(option)
   if (option.answers.present? && option.answers.find_by(user_id:current_user.id).present?)
   	 @answer = true	
   else
     @answer = false
   end
   @answer
 end

end
