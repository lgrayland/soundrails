class CommentsController < ApplicationController

  def index
    @track = Track.find(params[:track_id])
  end

  def create
    @track = Track.find(params[:track_id])
    @comment = @track.comments.new(comment_params)
    @comment.status = "draft"
    @comment.user = current_user
    @comment.save
    redirect_to @track
  end

  def approve
    # comments = Comment.find(params[:comment_ids])
    # comments.update_all(status: "approved")
    # Comment.update_all({status: "approved"}, {id: params[:comment_ids]})
    Comment.where("id IN (?)", params[:comment_ids]).update_all(status: "approved")
   redirect_to track_comments_path
 end

 def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to(track_path)
end

def comment_params
  params.require(:comment).permit(:title, :comment, :track_id, :status)
end

end