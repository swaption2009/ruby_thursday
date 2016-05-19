require 'rails_helper'

feature 'signing in' do
  let(:user) {FactoryGirl.create(:user)}

  def fill_in_signing_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Sign In"
  end

  scenario "visiting the site to log in" do
    visit root_path
    click_link "Log In"
    fill_in_signing_fields
    expect(page).to have_content("Signed in successfully.")
  end
end