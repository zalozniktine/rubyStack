class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

         has_many :comments
         has_many :questions
         has_many :answers
         has_one_attached :avatar
         acts_as_voter

         has_many :likes, dependent: :destroy


  def self.from_omniauth(access_token)
      person = Person.where(email: access_token.info.email).first
  
      unless person
           person = Person.create(
              email: access_token.info.email,
              password: Devise.friendly_token[0,20]
           )
      end
      person.username = access_token.info.name
      person.uid = access_token.uid
      person.provider = access_token.provider
      person.save
      person
  end
end

