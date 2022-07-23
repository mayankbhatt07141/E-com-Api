class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  def update_password
      resource = User.find_by_email(params[:user][:email])
      if resource && resource.update_with_password(password_update_params)
        bypass_sign_in resource, scope: :user
        render json: { notice: 'Password has been successfully updated' }, status: :ok
      else
        clean_up_passwords resource
        render json: { error: "Couldn't update the password! Please try again." }, status: :unprocessable_entity
      end
  end
  def reset_password
      resource = User.find_by_email(params[:user][:email])
      puts params[:user][:role]==resource.role
      if resource && params[:user][:role]==resource.role
        resource.password=params[:user][:password]
        resource.save
        render json: { notice: 'Password has been successfully changed' }, status: :ok
      else
        render json: { error: "Couldn't reset the password! Please try again." }, status: :unprocessable_entity
      end
  end
  private
  
  def sign_up_params
    resource_params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def account_update_params
    resource_params.permit(:email, :current_password, :first_name, :last_name)
  end

  def password_update_params
    resource_params.permit(:password, :password_confirmation, :current_password)
  end
  def password_reset_params
    resource_params.permit(:email,:password)
  end

  def resource_params
    params.require(:user)
  end


  def load_resource
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  end
    
end
