class SessionsController <BaseController
    skip_before_action :authenticate_user!
    skip_before_action :authenticate_user_using_x_auth_token
    skip_before_action :verify_authenticity_token
  def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    if invalid_password?(user)
      respond_with_error "Incorrect email or password", 401
    else
      sign_in(user)
      # render json: { auth_token: user.authentication_token, user: user, is_admin: user.super_admin? },
              # location: root_path, status: :created
      render json: { auth_token: user.authentication_token, user: user },
              location: root_path, status: :created
    end
  end

  def destroy
    sign_out(@user)
    reset_session
  end

  private

    def invalid_password?(user)
      user.blank? || !user.valid_password?(params[:user][:password])
    end
end