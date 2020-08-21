class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:indexa,:indexb,:indexc,:indexd, :show]
  def index
    @posts=Post.all.order(created_at: :desc)
    if params[:search] == nil
      @posts= Post.all.order(created_at: :desc)
    elsif params[:search] == ''
      @posts= Post.all.order(created_at: :desc)
    else
      #部分検索
      @posts = Post.where("title LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def indexa
    @posta=Post.where(genre: '日本映画・ドラマ' )


  end
    
  def indexb
    @postb=Post.where(genre: '韓国映画・ドラマ')


  end

  def indexc
    @postc=Post.where(genre: '海外ドラマ')


  end

  def indexd
    @postd=Post.where(genre: '海外映画')


  end

  def show
   @post=Post.find_by(id: params[:id])
   @user=User.find_by(id: @post.user_id)
  end

  def new
    @post=Post.new
  
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end

  def create
    @post=Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to :action => "index"
    else
      flash[:postfalse]= "投稿に失敗しました"
      @post= Post.new(post_params)
      render action: :new
    end
  end
  

  
  
 private
  def post_params
     params.require(:post).permit(:genre,:title,:released_year,:image,:summary,:director,:cast,:casta,:castb) 
  end
end