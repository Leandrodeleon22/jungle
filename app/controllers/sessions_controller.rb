class SessionsController < ApplicationController
  
  def new
  end

  def create
    
    # @user = User.find_by(email: params[:email])
    @user = User.authenticate_with_credentials(params[:email], params[:password])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end