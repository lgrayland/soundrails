class CommentsController < ApplicationController

  def create
    @track = Track.find(params[:track_id])
    @comment = @track.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @track
  end
  
  def comment_params
    params.require(:comment).permit(:title, :comment)
  end

end