class TimecardsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  def index
    @timecards = @user.timecards.all
  end

  def new
    @timecard = @user.timecards.build
    respond_to do |format|
			format.html{ redirect_to @timecard, notice: 'User was successfully created.' }
			format.js {}
		end
  end

  def create
    @timecard = @user.timecards.build(timecard_params)
    respond_to do |format|
      if @timecard.save
        format.html { redirect_to user_timecards_path(@timecard.user_id), notice: 'User was successfully created.' }
        # format.json { render :index, status: :created, location: @timecard }
        # format.js { @status = "success"}
      else
        format.html { render :new }
        # format.json { render json: @timecard.errors, status: :unprocessable_entity }
        # format.js { @status = "fail" }
      end
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
