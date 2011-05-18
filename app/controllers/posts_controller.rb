class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    with_action do |a|
      a.create do
        @post = Post.new(params[:post])
        if @post.save
          flash[:notice] = 'Post created'
          redirect_to posts_url
        else
          render :new
        end
      end
      a.cancel do
        redirect_to posts_url
      end
    end
  end

  def destroy
    if Post.destroy(params[:id])
      flash[:notice] = 'Post deleted'
    else
      flash[:error] = 'Unable to delete post'
    end
    redirect_to posts_url
  end
end

