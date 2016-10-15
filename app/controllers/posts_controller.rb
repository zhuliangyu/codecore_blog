class PostsController < ApplicationController
  def index
    @posts=Post.order("created_at DESC")
  end

  def new
    @post=Post.new

  end

  def create
    p=params.require(:post).permit([:title,:body])
    @post=Post.new(p)
    if @post.save
      redirect_to post_path(post)
    else
      render :new
    end

  end

  def show
    @post = Post.find params[:id]


  end

  def edit
    @post=Post.find params[:id]

  end

  def update
      post_params = params.require(:post).permit(:title, :body)
      post = Post.find params[:id]
      post.update post_params
      redirect_to post_path(post)


  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path
  end

end
