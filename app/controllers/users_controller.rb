class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index,:indexa,:indexb,:indexc,:indexd, :show]
  def index
    @users=User.all.order(created_at: :desc)
  end

  def show
    @user=User.find(params[:id])
    @posts=@user.posts
    
  end

  def create
    @user = User.new(
      user_name: params[:user_name],
      email: params[:email],
    )
    if @user.save
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
    
  end

  def destroy
    Post.find(params[:id]).destroy
    if  current_user == @post.user
      @post.destroy
      redirect_to action: :show
    else
      redirect_to @post, error: "権限がありません"
    end
  end
end
