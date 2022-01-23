class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :comments
         has_many :questions
         has_many :answers
         has_one_attached :avatar

  #def avatar_thumbnail
    #avatar.variant(resize: "150x150!")
  #end
end
