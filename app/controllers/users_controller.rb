class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,{only: [:edit, :update]}
  def show
  	@user = User.find(params[:id])
	@book = Book.new
	@books = Book.all
     end
  def index
  	@book = Book.new
    @users = User.all
    @user = current_user
  end
   def create
   	    users = User.new(user_params)
        users.save
        redirect_to users_path
  end
   def edit
  	@user = User.find(params[:id])
  end

def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice]="successfully"
    redirect_to user_path(@user.id)
  else
    render 'edit'
  end
end

  private
   def user_params
      params.require(:user).permit(:name,:introduction,:profile_image)
    end

    def correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
