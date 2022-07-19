class DesksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @desks = Desk.all
  end

  def show
    @desk = Desk.find(params[:id])
    @request = Request.new
  end
end
