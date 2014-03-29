require "pony"
require "dotenv"
Dotenv.load

module Mailer
  def send_daily_balance(balance)
    Pony.mail({
      :to => ENV['GMAIL_TO'],
      :from => ENV['GMAIL_FROM'],
      :body => "Hello! Your checking account balance is: #{balance}.",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => ENV['GMAIL_FROM'],
        :password             => ENV['GMAIL_PASSWORD'],
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })
  end
end
