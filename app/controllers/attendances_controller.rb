class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @attendance = Attendance.new(
      attended_event_id: event_params[:attended_event_id],
      attendee_id: current_user.id
    )
    if @attendance.save
      redirect_to user_path(current_user), notice: "Attendance confirmed."
    else
      redirect_to events_path, notice: "Attendance not registered."
    end

  end

  private

  def event_params
    params.require(:attendance).permit(:attended_event_id)
  end

end
