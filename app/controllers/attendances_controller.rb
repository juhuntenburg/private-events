class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attended_events << Event.find(params[:id])
    if @attendance.save
      redirect_to user_path(current_user), notice: "Attendance confirmed."
    else
      redirect_to event_path(params[:id]), notice: "Attendance confirmed."
    end
  end

end
