class UsersController < ApplicationController
  def show
    @user = User.find(params["id"])
  end

  def new
    @user = User.new
  end

  def create
    # Parameters: "user"=>
    # {"first_name"=>"Alex", 
    #"last_name"=>"Gheorghe"
    # "email"=>"akkk"

    plain_text_password = params["user"]["password"] # = akkk
    @user = User.new(params["user"])
    @user.password = BCrypt::Password.create(plain_text_password)
    @user.save
    redirect_to "/users/#{@user.id}"
  end
end
