class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create, :new, :confirm_email]
  def index
    @request = Request.new
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    # if request.email.confirmed?
    #   @request.email = "confirmed"
    # else
    #   @request.email = "unconfirmed"
    # end
    @request.status = "unconfirmed"
    if @request.save
      mail = RequestMailer.with(request: @request).create_confirmation
      mail.deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  def confirm_email
    @request = Request.find(params[:request_id])
    @request.status = "confirmed"
    last_request = Request.find_by(status: "confirmed")
    if !last_request.nil?
      @request.waiting_position = last_request.waiting_position + 1
    else
      @request.waiting_position = 1
    end
    if @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone_number, :biography, :status)
  end
end
