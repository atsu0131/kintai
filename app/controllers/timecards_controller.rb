class TimecardsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  def index
    @timecards = @user.timecards.all
  end

  def new
    @timecard = @user.timecards.build
  end

  def create
    @timecard = @user.timecards.build(timecard_params)

    if @timecard.save
      redirect_to  user_timecards_url(@user)
    else
      render :new
    end
  end

  private

  def timecard_params
    params.require(:timecard).permit(:user_id, :start_at, :end_at)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
