class UsersController < ApplicationController
  before_action :set_department, only: [:index, :new, :create]
  def index
    @users = @department.users.where(active: true)
  end

  def new
    @user = @department.users.build
  end

  def create
    @user = @department.users.build(user_params)

    if @user.save
      redirect_to  department_users_url(@department)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :position, :active)
  end

  def set_department
    @department = Department.find(params[:department_id])
  end
end