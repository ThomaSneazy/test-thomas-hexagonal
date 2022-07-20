class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create, :new]
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
    if @request.save
      mail = RequestMailer.with(request: @request).create_confirmation
      mail.deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def request_params
    params.require(:request).permit(:name, :email, :phone_number, :biography)
  end
end
