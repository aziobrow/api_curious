require 'rails_helper'

feature "user can see basic user info" do
  before do
    stub_omniauth
    visit root_path
    click_link("Sign in with Github")

    VCR.use_cassette("GithubService") do
      visit '/aziobrow'
    end
  end

  it "user can see profile pic" do
    expect(page).to have_css(".profile-pic")
  end

  it "user can see number of starred repos" do
      expect(page).to have_content("Stars 1")
  end

  it "user can see followers" do
      expect(page).to have_content("Followers 2")
  end

  it "user can see users following" do
      expect(page).to have_content("Following 1")
  end
end
