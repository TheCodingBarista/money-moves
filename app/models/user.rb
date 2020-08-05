class User < ApplicationRecord

  has_many :stars, dependent: :destroy
  has_many :entries, through: :stars
  has_many :notes, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :spotify]

  def self.create_from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.username = auth.info.nickname

      #user.skip_confirmation!
    end
  end     

  def email_required?
    false
  end

  def star!(entry)
    self.stars.create!(entry_id: entry.id)
  end

  def unstar!(entry)
    star = self.stars.find_by_entry_id(entry.id)
    star.destroy!
  end
end
