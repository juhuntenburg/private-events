class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      Invitation.find_by(invitee_id: attendance_params[:attendee_id], invited_event_id: attendance_params[:attended_event_id]).destroy
      redirect_to user_path(current_user), notice: "Attendance confirmed."
    else
      redirect_to events_path, notice: "Attendance not registered."
    end

  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id, :attendee_id)
  end

end
