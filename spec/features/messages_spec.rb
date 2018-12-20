require 'capybara/rspec'
require './app.rb'

feature "" do
  scenario "" do
    visit('/')
    fill_in 'message', with: "Michael"
    click_button "Submit"
    expect(page).to have_text("Michael")
  end
end

message = "Message to test only display first 20 chars"
feature "page displays message < 20" do
  scenario "user only sees 20 characters" do
    visit ('/')
    fill_in 'message', with: message
    click_button "Submit"
    expect(page).to have_no_content "display first 20 chars"
  end

  feature "page takes user to full message" do
    scenario "clicking on <20chars message links to full message" do
      visit ('/')
      fill_in 'message', with: message
      click_button "Submit"
      click_link "fullmessage"
      visit ('/full-message')
      expect(page).to have_text message
    end
  end
end
