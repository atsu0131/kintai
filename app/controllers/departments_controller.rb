class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    @user_counts = User.group(:department_id).count
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_url, notice: "作成しました"
    else
      render :new
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      redirect_to departments_url, notice: "更新しました"
    else
      render :edit
    end
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end