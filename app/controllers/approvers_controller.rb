class ApproversController < ApplicationController
  def new
    @department = Department.find(params[:department_id])
    @approver = @department.approval_authorities.build
  end

  def edit
    @approver = ApprovalAuthorities.find(params[:id])
  end

  def update
    @approver = ApprovalAuthorities.find(params[:id])
    if @approver.update(approver_params)
      redirect_to departments_path
    else
      render :edit
    end
  end

  private

  def approver_params
    params.require(:approval_authority).permit(:user_id, :department_id)
  end
end
