require 'rails_helper'

describe GithubService do
  user = User.create
  subject { GithubService.new(user) }

  context "initialize" do
    it "returns an instance" do
      expect(subject).to be_a(GithubService)
    end
  end

end
