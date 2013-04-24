require 'yaml'

YAML::ENGINE.yamler= 'syck'
Omniauth_keys = YAML.load_file("#{Rails.root}/config/omniauth.yml")[::Rails.env]