class CommentsController < ApplicationController
  include CommentsHelper
	def index
		@comments = Comment.all.where(parent_id: nil)
	end

	def new
    @comment = Comment.new(parent_id: params[:parent_id])
	end

	def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to comments_path
    else
      render 'new'
    end
	end

  private

    def comment_params
      params.require(:comment).permit(:title, :body, :author,:parent_id)
    end

end




