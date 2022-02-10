class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

         has_many :comments
         has_many :questions
         has_many :answers
         has_one_attached :avatar
         acts_as_voter

         has_many :likes, dependent: :destroy


         def self.from_omniauth(auth)
          name_split = auth.info.name.split(" ")
          person = Person.where(email: auth.info.email).first
          person ||= Person.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])
            person
        end
end

