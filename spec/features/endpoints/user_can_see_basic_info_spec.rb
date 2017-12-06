require 'rails_helper'

feature "user can see basic user info" do
  it "user can see profile pic" do
    visit basic_info_path
    expect(page)
  end

  it "user can see number of starred repos" do
    
  end

  it "user can see followers" do

  end

  it "user can see users following" do

  end
end
