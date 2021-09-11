class PostsController < ApplicationController
  # skip_before_action :login_required, only: [:index]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
    @favorite  =current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
        @post = Post.new
      end
  end

  def create
    @post = current_user.posts.build(post_params)
      if params[:back]
        render :new
      else
        if @post.save
          # UserMailer.user_mailer(current_user).deliver
          flash[:success] = "Post crée avec succès"
          redirect_to posts_url
        else
          render :new
        end
      end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post mis à jour avec succès"
      redirect_to posts_url
    else
      render :edit
    end
 end

 def destroy
  @post.destroy
  flash[:danger] = "Post supprimé avec succès!"
  redirect_to posts_url
end

private
    
def set_post
  @post = Post.find(params[:id])
end

def post_params
  params.require(:post).permit(:illustration, :illustration_cache, :description)
end
end
