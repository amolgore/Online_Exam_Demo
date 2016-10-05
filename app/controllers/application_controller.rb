class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path
  end
  
  def after_sign_in_path_for(resource)
  	if current_user.has_role? "teacher"
    	teacher_dashboard_path
    else
    	student_dashboard_path
    end
  end

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {
        |u| u.permit( :email, :password,
                      :password_confirmation, :role_ids)}
  end



  
  

  
end
