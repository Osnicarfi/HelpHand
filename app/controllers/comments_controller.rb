class CommentsController < ApplicationController



	def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.create(params[:comment])
	    @comment.user_id = current_user.id
	     
	     respond_to do |format|
	     	if @comment.save
	     		format.html {redirect_to @post, notice: 'Comment added'}
	     		format.json { render json: @comment.errors, tatus: :unprocessable_entity }
	     	        end
	        end
             

     end

     def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to(@comment.post)
 	 end

   
    
  
end
