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

# def stub_omniauth
#   # first, set OmniAuth to run in test mode
#   OmniAuth.config.test_mode = true
#   # then, provide a set of fake oauth data that
#   # omniauth will use when a user tries to authenticate:
#   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
#     {"provider"=>"github",
#  "uid"=>"25802671",
#  "info"=>
#   {"nickname"=>"aziobrow",
#    "email"=>"aziobrow@gmail.com",
#    "name"=>"Aurora Ziobrowski",
#    "image"=>"https://avatars2.githubusercontent.com/u/25802671?v=4",
#    "urls"=>{"GitHub"=>"https://github.com/aziobrow", "Blog"=>""}},
#  "credentials"=>{"token"=>"d5d487c7c305ff7f943d7442c181a8bc10078bfa", "expires"=>false}
# })
# end
