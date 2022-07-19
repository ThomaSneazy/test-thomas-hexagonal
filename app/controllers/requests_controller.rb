class RequestsController < ApplicationController
  def index
  end

  def create
    @request = Request.new
    @desk = Desk.find(params[:desk_id])
    @request.desk = @desk
    @request.user_id = current_user.id
    if current_user.confirmed?
      @request.status = "confirmed"
    else
      @request.status = "unconfirmed"
    end
    if @request.save!
      redirect_to desk_path(@desk.id)
    else
      redirect_to desks_path
    end
  end

  def show
  end

  private
end
