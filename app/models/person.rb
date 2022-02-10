class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

         has_many :comments
         has_many :questions
         has_many :answers
         has_one_attached :avatar
         acts_as_voter

         has_many :likes, dependent: :destroy


         def self.from_omniauth(access_token)
          data = access_token.info
          person = Person.where(email: data['email']).first
      
          unless person
              person = Person.create(
                 email: data['email'],
                 password: Devise.friendly_token[0,20],
                 username: access_token.info.name,
                 uid: access_token.uid
              )
          end
          person
        end

end

