class UsersController < ApplicationController
  def index
    @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to '/', notice: 'User created!'
    else
      redirect_to '/users/index'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

end
