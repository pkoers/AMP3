class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # command to send emails via mailtrap
    if current_user.present?
      # SendMailer.send_email(current_user).deliver_now
      users = Entry.pluck(:email)
      users.each do |user|
        SendMailer.send_email(user).deliver_now
      end
    end
  end
end
