class AnswersController < ApplicationController
    before_action :set_answer, only: [:edit, :update, :show, :destroy, :like, :unlike]
    before_action :authenticate_person! 



    def upvote
        @answer = Answer.find(params[:id])
        if current_person.voted_up_on? @answer
          @answer.unvote_by current_person
        else
          @answer.upvote_by current_person
        end
        redirect_to question_path(params[:question_id])
        #render "vote.js.erb"
        
    end
    
    def downvote
        @answer = Answer.find(params[:id])
        if current_person.voted_down_on? @answer
          @answer.unvote_by current_person
        else
          @answer.downvote_by current_person
        end
        redirect_to question_path(params[:question_id])
        #render "vote.js.erb"
    end
    


    def destroy
        Answer.find(params[:id]).destroy
        redirect_to question_path(params[:question_id])
    end

    def create
        #create a new answer
        @answer = current_person.answers.new(answer_params)
        if !@answer.save
            flash[:notice] = @answer.errors.full_messages.to_sentence
        end

        redirect_to question_path(params[:question_id])
    end

    def like
        @answer.liked_by current_person
        respond_to do |format|
            format.html {redirect_back fallback_location: root_path}
        end
    end

    def unlike
        @answer.unliked_by current_person
        respond_to do |format|
            format.html {redirect_back fallback_location: root_path}
        end
    end

    private

    def answer_params
        params
        .require(:answer)
        .permit(:content, :parent_id)
        .merge(question_id: params[:question_id])
    end


end
