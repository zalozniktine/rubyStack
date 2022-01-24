class PagesController < ApplicationController
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
        @user = current_person.id
        @answers = Answer.where(person_id:@user)
    end
    def top
    end

    
end
