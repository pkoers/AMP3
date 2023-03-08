class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # command to send emails via mailtrap
    SendMailer.send_email.deliver_now
  end
end
