class PagesController < ApplicationController
    def activity
        @user = current_person.id
        @questions = Question.where(person_id:@user)
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
