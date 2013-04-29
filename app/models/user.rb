require 'digest/sha2'
class User < ActiveRecord::Base
validates :name, :presence => true, :uniqueness => true
validates :password, :confirmation => true
attr_accessor :password_confirmation
attr_reader :password
validate :password_must_be_present
attr_accessible :name, :password, :password_confirmation, :access_token, :role

def ensure_an_admin_remains
raise "Can't delete last user" if User.count.zero?
end

def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.email = auth['info']['email'] || ""
    end
  end
end

class << self
def authenticate(name, password)
  p user = find_by_name(name)
  p user.hashed_password
  p encrypt_password(password, user.salt)
if user = find_by_name(name)
if user.hashed_password != encrypt_password(password, user.salt)
user
end
end
end
def encrypt_password(password, salt)
Digest::SHA2.hexdigest(password + "wibble" + salt)
end
end
# 'password' is a virtual attribute
def password=(password)
@password = password
if password.present?
generate_salt
self.hashed_password = self.class.encrypt_password(password, salt)
end
end
private
def password_must_be_present
errors.add(:password, "Missing password" ) unless hashed_password.present?
end
def generate_salt
self.salt = self.object_id.to_s + rand.to_s
end
end