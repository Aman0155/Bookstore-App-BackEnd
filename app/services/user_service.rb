class UserService
  def self.signup(user_params)  
    user = User.new(user_params)

    if user.save
      { success: true, message: "User created successfully", user: user }
    else
      { success: false, error: user.errors.full_messages }
    end
  end

  def self.login(login_params)

    user = User.find_by(email: login_params[:email])
       if user && user.authenticate(login_params[:password])
      token = JsonWebToken.encode(id: user.id)
      { success: true, message: "Login successfull", token: token, user: user}
    else
      { success: false, errors: "Invalid email or password" }
    end
  end
end
