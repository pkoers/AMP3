class SendMailer < ApplicationMailer
  def send_email(user)
    mail(to: user, from: 'amp@mixty.com', subject: 'Test Email') do |format|
      format.text { render plain: 'This is a test email.' }
    end
  end

  #def send_email
  #  Entry.pluck(:email).each do |email|
  #    mail(to: email, from: 'amp@mixty.com', subject: 'Test Email') do |format|
  #      format.text { render plain: 'This is a test email.' }
  #    end
  #  end
  #end
end
