class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
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

  private

  def department_params
    params.require(:department).permit(:name, :email, :position, :active)
  end
end