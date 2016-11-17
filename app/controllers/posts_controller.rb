class PostsController < ApplicationController
  before_action :authenticate_user,except: [:index,:show]

  before_action :find_post,except: [:index,:new,:create]


  def index
    @posts=Post.includes(:category).order("created_at DESC").page(params[:page])
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new post_params
    @post.user=current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    # redirect_to home_path, alert: "access defined" unless can? :manage, @post
    @comment=Comment.new
  end

  def edit
    render :new
  end

  def update
    @post.update post_params
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def search
    @keyword=params[:keyword]
    @posts_pre=Post.where(["title ILIKE ? or body ILIKE?", "%#{@keyword}%", "%#{@keyword}%"])
    @posts=@posts_pre.page(params[:page])
    render "/posts/index.html.erb"
  end

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit([:title, :body, :category_id,:image])
  end

end
