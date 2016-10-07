class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	def create
  	@comment = current_user.comments.new comment_params
  	@comment.save
  	redirect_to micropost_path(comment_params[:micropost_id])
  end

  def new
  end

  private
  	def comment_params
  		params.require(:comment).permit(:content, :user_id, :micropost_id)
    end
end
