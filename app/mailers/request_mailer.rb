class RequestMailer < ApplicationMailer
  def create_confirmation
    @request = params[:request]

    mail(
      to:       @request.email,
      subject:  "request #{@request.name} created!"
    )
  end
end
