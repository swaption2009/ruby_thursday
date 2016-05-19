require 'rails_helper'

feature 'signing in' do
  let(:hacker) {FactoryGirl.create(:hacker)}

  def fill_in_signing_fields
    fill_in "hacker(email)", with: hacker.email
    fill_in "hacker(password", with: hacker.password
    click_button "Log In"
  end

  scenario "visiting the site to log in" do
    visit root_path
    click_link "Sign In"
    fill_in_signin_fields
    expect(page).to have_content("Signed in successfully.")
  end
end