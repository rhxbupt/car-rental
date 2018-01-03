class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show,:index]
  def new
    @user = User.new
  end
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @car = @user.car.find_by(user_id:@user.id)
    @history = History
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulations! You successfully signed up!"
      if logged_in?
        redirect_to '/users'
      else
        redirect_to '/sessions/new'
        end
    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to '/sessions/new'
    end
  end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,:role,:noc)
    end


end
