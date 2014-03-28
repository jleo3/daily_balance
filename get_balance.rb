require "capybara"
require "pry-debugger"
require "dotenv"

include Capybara::DSL
Dotenv.load

Capybara.default_driver = :selenium

visit "http://www.mint.com"
click_button "Log in"
fill_in "Email", with: ENV["MINT_EMAIL"]
fill_in "Password", with: ENV["MINT_PASSWORD"]
click_button "Log in"
puts find("#account-#{ENV["MINT_ACCOUNT"]}").find(".balance").text
