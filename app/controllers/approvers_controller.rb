class ApproversController < ApplicationController
  def new
    @department = Department.find(params[:department_id])
    @approver = @department.approvers.build
  end

  def edit
    @department = Department.find(params[:department_id])
    @approver = Approver.find(params[:id])
  end

  def update
    @approver = Approver.find(params[:id])
    if @approver.update(approver_params)
      redirect_to departments_path
    else
      render :edit
    end
  end

  private

  def approver_params
    params.require(:approver).permit(:user_id, :department_id)
  end
end
