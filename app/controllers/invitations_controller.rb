class InvitationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Invitation.exists?(invitation_params)
      redirect_to event_path(invitation_params[:invited_event_id]), notice: "You already invited this user for this event."
    else
      @invitation = Invitation.new(invitation_params)
      if @invitation.save
        redirect_to event_path(@invitation.invited_event), notice: "Invitation sent."
      else
        redirect_to event_path(@invitation.invited_event), notice: "Invitation not sent."
      end
    end

  end

  private

  def invitation_params
    params.require(:invitation).permit(:invited_event_id, :invitee_id)
  end

end
