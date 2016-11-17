class CommentsController < ApplicationController
  before_action :authenticate_user

  def index
    @comments=Comment.order(:created_at)
  end

  def new
    @comment=Comment.new
  end

  def create
    @post=Post.find(params[:post_id])
    comment_params=params.require(:comment).permit([:title, :body])
    @comment=Comment.new(comment_params)
    @comment.post=@post
    @comment.user=current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"

    end
  end

  def show

  end

  def edit
    @comment=Comment.find(params[:id])
    render :new


  end

  def update

    comment_parmas=params.require(:comment).permit(:title, :body)
    @comment=Comment.find(params[:id])
    @comment.update(comment_parmas)
    redirect_to comments_path

  end

  def destroy
    # render plain:"asd"
    post=Post.find(params[:post_id])
    comment=Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(post)

  end
end
