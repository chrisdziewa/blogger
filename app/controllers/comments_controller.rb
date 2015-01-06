class CommentsController < ApplicationController
	def create 
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		
		@comment.save

		flash.notice = "Your comment has been successfully posted!"

		redirect_to article_path(@comment.article)
	end

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
end

