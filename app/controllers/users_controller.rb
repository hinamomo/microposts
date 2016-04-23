class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def user_params_profile
    params.require(:user).permit(:email, :introduction,
                                 :area, :homepage, :birthday)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params_profile)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'プロフィールを編集しました'
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
end