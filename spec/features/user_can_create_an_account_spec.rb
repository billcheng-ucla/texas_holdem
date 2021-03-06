require "rails_helper"

RSpec.feature "user can create an account" do
  scenario "user is sent to game room" do
    visit root_path

    within ".nav" do
      click_on "Create Account"
    end
    within(".create-account") do
      fill_in "Email", with: "jones@gmail.com"
      fill_in "Username", with: "jones"
      fill_in "Password", with: "123"
      click_on "Create Account"
    end

    expect(current_path).to eq user_path(User.last.id)
  end

  scenario "user sees error when fields are not all filled in" do
    visit root_path

    within ".nav" do
      click_on "Create Account"
    end

    within(".create-account") do
      fill_in "Username", with: "jones"
      fill_in "Password", with: "123"
      click_on "Create Account"
    end

    expect(page).to have_content "Invalid credentials"
    expect(current_path).to eq root_path
  end
end
