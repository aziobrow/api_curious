require 'rails_helper'

feature "user can see basic user info" do
  before do
    visit basic_info_path
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
