class UsersController < ApplicationController
  before_action :set_department, only: [:index, :new, :create]
  def index
    @users = @department.users.where(active: true)
    @q = @users.search(params[:q])
    @users = @q.result
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to department_users_url(@user)
    else
      render :edit
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