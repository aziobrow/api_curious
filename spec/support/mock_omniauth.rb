def stub_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    {"provider"=>"github",
 "uid"=>"25802671",
 "info"=>
  {"nickname"=>"aziobrow",
   "email"=>"aziobrow@gmail.com",
   "name"=>"Aurora Ziobrowski",
   "image"=>"https://avatars2.githubusercontent.com/u/25802671?v=4",
   "urls"=>{"GitHub"=>"https://github.com/aziobrow", "Blog"=>""}},
 "credentials"=>{"token"=>"d5d487c7c305ff7f943d7442c181a8bc10078bfa", "expires"=>false}
})
end
