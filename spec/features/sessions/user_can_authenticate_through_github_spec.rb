require 'rails_helper'

describe "a user can login" do
  it "a user sees a login page" do
    visit root_path
    click_link("Login with Github")
    
  end
end
