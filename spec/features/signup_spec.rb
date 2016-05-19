require 'rails_helper'

feature 'signing up' do
  let(:user) {FactoryGirl.create(:user)}

  def fill_in_signing_up_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password_confirmation
    click_button "Sign up"
  end

  scenario "visiting the site to log in" do
    visit root_path
    fill_in_signing_up_fields
    expect(page).to have_content("Signed up successfully.")
  end
end