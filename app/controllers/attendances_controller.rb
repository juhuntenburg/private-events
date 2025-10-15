class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Attendance.exists?(attendance_params)
      redirect_to user_path(current_user), notice: "You already registered for this event."
    else
      @attendance = Attendance.new(attendance_params)
      if @attendance.save
        redirect_to user_path(current_user), notice: "Attendance confirmed."
      else
        redirect_to events_path, notice: "Attendance not registered."
      end
    end

  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id, :attendee_id)
  end

end
