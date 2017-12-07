class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    new_user = find_or_create_by(user_id: auth_info[:uid]) do |user|
      user.provider = auth_info[:provider]
      user.user_id = auth_info[:uid]
      user.name = auth_info[:info][:name]
      user.username = auth_info[:info][:nickname]
      user.email = auth_info[:info][:email]
      user.oauth_token = auth_info[:credentials][:token]
    end
    # new_user.check_token(auth_info)
  end

  def check_token(auth_info)
    if user.oauth_token != auth_info[:credentials][:token]
      user.oauth_token = auth_info[:credentials][:token]
    end
  end
end
