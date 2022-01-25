class LikesController < ApplicationController
    before_action :find_answer
    before_action :find_like, only: [:destroy]

    def find_like
        @like = @answer.likes.find(params[:id])
     end

    def create

      @answer.likes.create(person_id: current_person.id)
      #redirect_to question_path(@answ)

end
def destroy

      @like.destroy
    #  redirect_to post_path(@post)
  end

  def already_liked?
    Like.where(person_id: current_person.id, person_id:
    params[:person_id]).exists?
end

def find_answer
  @answer = Answer.find(params[:answer_id])
end
    private

    

    
end
