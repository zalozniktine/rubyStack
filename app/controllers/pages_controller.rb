class PagesController < ApplicationController
    before_action :set_person
    
    def activity
        @user = current_person.id
        @questions = Question.where(person_id:@user)

        @comments = Answer.where.not(parent_id: nil).where(person_id:@user)

        @answers = Answer.where(person_id:@user).where(parent_id: nil)

    end
    def questions
        @user = current_person.id
        @questions = Question.where(person_id:@user)
    end
    def answers
    end
    def top
    end
    def policy
    end

    def set_person
        @person = current_person
    end
    
end
