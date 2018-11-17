class TimecardsController < ApplicationController
  def index
  end

  def new
    @timecard = Timecard.new
  end

  def create
    @timecard = Timecard.new(timecard_params)
    if @timecard.save
      redirect_to timecards_url
    else
      render :new
    end
  end

  private

  def timecard_params
    params.require(:department).permit(:user_id, :start_at, :end_at)
  end
end