class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

         has_many :comments
         has_many :questions
         has_many :answers
         has_one_attached :avatar
         

         has_many :likes, dependent: :destroy

         def self.from_omniauth(access_token)
          data = access_token.info
          person = Person.where(email: data['email']).first
      
          # Uncomment the section below if you want users to be created if they don't exist
          unless person
              person = Person.create(
                 email: data['email'],
                 encrypted_password: Devise.friendly_token[0,20]
              )
          end
          person
      end
    acts_as_voter
end
