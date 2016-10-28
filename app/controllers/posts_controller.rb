class PostsController < ApplicationController
  before_action :authenticate_user,except: [:index,:show]


  before_action :find_post,except: [:index,:new,:create]




  def find_post
    @post = Post.find params[:id]


  end


  def index
    @posts=Post.order("created_at DESC").page(params[:page])
  end

  def new

    @post=Post.new


  end

  def create
    p=params.require(:post).permit([:title, :body, :category_id])

    @post=Post.new(p)
    @post.user=current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end

  end

  def show
    find_post

    # redirect_to home_path, alert: "access defined" unless can? :manage, @post


    @comment=Comment.new


  end

  def edit
    render :new

  end

  def update
    post_params = params.require(:post).permit(:title, :body, :category_id)
    find_post

    @post.update post_params
    redirect_to post_path(@post)


  end

  def destroy
    find_post
    @post.destroy
    redirect_to posts_path
  end

  def search

    @keyword=params[:keyword]
    @posts_pre=Post.where(["title ILIKE ? or body ILIKE?", "%#{@keyword}%", "%#{@keyword}%"])


    @posts=@posts_pre.page(params[:page])


    render "/posts/index.html.erb"

  end

end
