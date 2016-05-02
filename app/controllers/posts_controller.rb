class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user!, only: [:destroy, :edit, :update]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
     # => {title: '', content:''}
    if @post.update(post_params)
      redirect_to "/posts/#{@post.id}/edit"
    else
      render :edit
    end
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
     # => {title: '', content:''}

     if @post.save
       redirect_to "/posts/#{@post.id}"
     else
       render :new
     end
  end

  def destroy
    @post.destroy
    redirect_to "/posts"
  end

  private

    def correct_user!
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to "/posts" unless @post
    end

    def post_params
      params.require(:post).permit(:title, :content)

    end

end
