class SendMailer < ApplicationMailer
  def send_email(user)
    mail(to: user.email, from: 'amp@mixty.com', subject: 'Test Email') do |format|
      format.text { render plain: 'This is a test email.' }
    end
  end
end
