Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Omniauth_keys['fb_client_id'], Omniauth_keys['fb_client_secret'], :scope => 'email,user_birthday'
end
