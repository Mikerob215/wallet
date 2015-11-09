class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
  end

  def show
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes.(user_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def show
  end



  private
    def user_params
      params.require(:user).permit(:fname, :lname, :phone_number, :email, :password, :password_confirmation)
    end
  end
