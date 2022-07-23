class UsersController < BaseController
    skip_before_action :authenticate_user!, only: [:create]
    skip_before_action :authenticate_user_using_x_auth_token, only: [:create]
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: [:show, :edit, :update, :destroy]
 


  def show
     @user=User.find_by_id(params[:id])
    #  puts @user.to_json.to_s
    if @user
      render json: @user
    else
      respond_with_error "User with id #{params[:id]} not found.", :not_found
    end
   
    # render json: @user
  end

  def show_email
     @user=User.find_by(email: params[:email])
     if @user
      render json: @user
     else
       respond_with_error "User with email #{params[:email]} not found.", :not_found
     end
  end

  def index
    if(params[:role])
      users= User.where({:role => params[:role]}).paginate(:page => params[:page], :per_page => 5)
    else
      users= User.paginate(:page => params[:page], :per_page => 5)
    end
    render json: users
  end

  def create
    user = User.create user_params
   
    if user.valid?
      sign_in(user)
      render json: { user: user, tokens: user.authentication_token }
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 422
    end
  end

  def update
    if @user.blank?
      respond_with_error "User with id #{params[:id]} not found.", :not_found

    elsif @user.update(user_params)
      render json: @user

    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: 422
    end
  end

  def destroy
    if @user.blank?
      respond_with_error "User with id #{params[:id]} not found.", :not_found

    elsif @user.destroy
      render json: @user

    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password,:role)
    end
  
end
