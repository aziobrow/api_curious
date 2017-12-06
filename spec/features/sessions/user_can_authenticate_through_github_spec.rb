require 'rails_helper'

describe "a user can login" do
  before do
    stub_omniauth
  end

  it "a user sees a login page" do
    visit root_path
    click_link("Sign in with Github")
    expect(status_code).to eq(200)
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Aurora Ziobrowski")
    expect(page).to have_content("Logout")
  end
end
