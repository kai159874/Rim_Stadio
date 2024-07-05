class Public::UsersController < ApplicationController
  before_action :set_current_user, only: [:mypage, :edit, :update]

  def mypage
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: "編集しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :public_uid)
  end

  def set_current_user
    @user = current_user
  end

end
