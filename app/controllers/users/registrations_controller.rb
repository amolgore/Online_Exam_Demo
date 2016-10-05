class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_permitted_parameters



  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   @user = User.new(user_params)
  #   @user.save!

  #    if @user.has_role? "teacher"
  #     redirect_to teacher_dashboard_path
  #   else
  #     redirect_to student_dashboard_path
  #   end
  # end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

# private

  # def after_sign_up_path_for(resource)
  #   if resource.is_a?(User)
  #     if @user.has_role? "teacher"
  #       redirect_to teacher_dashboard_path
  #     else
  #       redirect_to student_dashboard_path
  #     end
  #   else
  #     super
  #   end
  # end

  # def user_params
  #   params.require(:user).permit(:email, :password, :password_confirmation,:role_ids)
  # end


end
