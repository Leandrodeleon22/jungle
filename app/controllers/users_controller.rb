class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if User.exists?(email: @user.email)
      @user.errors.add(:email, "has already been taken")
      render :new

    elsif @user.save
      session[:user_id] = @user.id
      redirect_to '/' 
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end


end