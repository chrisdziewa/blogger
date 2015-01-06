class CommentsController < ApplicationController
	before_filter :require_login, except: [:create]

	def create 
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		
		if @comment.save
			flash.notice = "Your comment has been successfully posted!"
		else
			flash.notice = "There was a problem submitting your comment"
		end	

		redirect_to article_path(@comment.article)
	end

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
end

