class User < ActiveRecord::Base
  # def self.get_by_auth_hash(auth_hash)
  #   where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create(name: auth_hash[:info][:name])
  # end
end
