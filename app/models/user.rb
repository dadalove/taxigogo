class User < ActiveRecord::Base
  # def self.get_by_auth_hash(auth_hash)
  #   where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create(name: auth_hash[:info][:name])
  # end
  has_many :orders

  def self.from_omniauth(session)
    where(session.slice(:uid)).first_or_initialize.tap do |user|
    user.uid = session.uid
    user.name = session.info.name
    # user.oauth_token = session.credentials.token
    # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end

end
