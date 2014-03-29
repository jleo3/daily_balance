require "capybara"
require "pry-debugger"
require "dotenv"
require "./send_balance"

include Capybara::DSL
include Mailer
Dotenv.load

Capybara.default_driver = :selenium

visit "http://www.mint.com"
click_button "Log in"
fill_in "Email", with: ENV["MINT_EMAIL"]
fill_in "Password", with: ENV["MINT_PASSWORD"]
click_button "Log in"
balance = find("#account-#{ENV["MINT_ACCOUNT"]}").find(".balance").text
puts balance

send_daily_balance(balance)
