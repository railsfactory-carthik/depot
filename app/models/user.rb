require 'digest/sha2'
class User < ActiveRecord::Base

#validates :name, :presence => true, :uniqueness => true
#validates :password, :confirmation => true
#~ attr_accessor :password_confirmation, :name
#~ attr_reader :password
attr_accessible :name, :password, :password_confirmation, :hashed_password, :salt, :role,  :email, :access_token
#validate :password_must_be_present
after_destroy :ensure_an_admin_remains

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
   # p 2222222222222222222222222222222
    def authenticate(name, password)
      p password
      p 222222222222222222222222222222222222
      if user = find_by_name(name)
        user_password = Digest::SHA1.hexdigest("#{name},#{password}")
      if user.password == user_password
      user
      end
    end
  end

  
  def encrypt_password(password, salt)
  Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

# 'password' is a virtual attribute
  def password=(password)
    @password = password if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end  


private
  def password_must_be_present
  errors.add(:password, "Missing password" ) unless hashed_password.present?
end

  def generate_salt
  self.salt = self.object_id.to_s + rand.to_s
end

end
end
