class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def signup
    result = UserService.signup(user_params)
    
    if result[:success]
      render json: { message: result[:message], user: result[:user] }, status: :created
    else
      render json: { error: result[:error] }, status: :unprocessable_entity
    end
  end

  def login
    result = UserService.login(login_params)
    if result[:success]
      render json: {message: "login successfull", token: result[:token], user: result[:user]}, status: :ok
    else
      render json: {errors: result[:errors]}, status: :unauthorized
    end
  end 
    
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :mobile_number) 
  end

  def login_params
    params.require(:user).permit(:email , :password)
  end
end
