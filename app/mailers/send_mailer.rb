class SendMailer < ApplicationMailer
  require 'open-uri'
  require 'uri'

  def send_email(user)
    #url = 'https://www.mixty.com/docs/LDM.txt'
    # url = "https://nu.nl/robots.txt"
    # parsed_url = URI.parse(url)

    # Encode each component of the URL
    # encoded_path = parsed_url.path.split('/').map { |component| URI.encode_www_form_component(component) }.join('/')
    # encoded_url = "#{parsed_url.scheme}://#{parsed_url.host}#{encoded_path}"

    # Open the file using the encoded URL
    # file = open(url)
    attachments['LDM.txt'] = File.read(Rails.public_path.join('LDM.txt'))
    # attachments['LDM.txt'] = { mime_type: 'text/plain', content: file.read }

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
