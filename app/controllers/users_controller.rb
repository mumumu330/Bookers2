class UsersController < ApplicationController
  
     before_action :ensure_current_user, {only: [:edit,:update,:destroy]}
     #(ログインユーザー以外の情報を遷移しようとした時に制限をかける)


  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    # ユーザーデータを取得
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def  ensure_current_user
        @user = User.find(params[:id])
     if @user.id != current_user.id
        redirect_to user_path(current_user.id)

     end
  end

end