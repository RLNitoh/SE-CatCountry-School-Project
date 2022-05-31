class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]   #<<<< These are commented out until I find out what exactly need's to be excluded
  before_action :require_permission, except: [:index, :show, :new, :create] #<<<< same
  before_action :user_banned, except: [:index, :show] # when a user is banned (i.e. he was reported 5 times) he will only have access to index and show.

  def index
    @posts = Post.order(date: :desc)

    if current_user.reportCount == nil
      current_user.update(reportCount: 0)
    end

    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  # def create
  #   @post = current_user.posts.build(params.require(:post).permit(:content, :post_image, :isPublic, :title)) #need variables in "permit" here
  #   if @post.save
  #     @post.update(date: Date.current)
  #     flash[:success] = 'User post was successfully created.'
  #     redirect_to post_path(@post)
  #   else
  #     flash.now[:error] = 'Unable to create user post.'
  #     render :new
  #   end
  # end

  #
  # Create post from post_params
  #
  def create
    Post.create(post_params)

    redirect_to root_path
  end

  # 
  private 

  def post_params
    params.require(:post).permit(:descrption, :post_image, :user_id)
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:content, :post_image, :isPublic, :title)) 
      flash[:success] = 'User post was successfully updated.'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'Unable to update user post.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'User post was successfully destroyed.'
    redirect_to posts_url
  end

  
  def require_permission
    if Post.find(params[:id]).creator != current_user
      redirect_to posts_path, flash: { error: "You do not have permission to do that." }
    end
  end

  def user_banned
    if current_user.reportCount == nil
      current_user.update(reportCount: 0)
    end

    if current_user.reportCount >= 5
      redirect_to title_path, flash: { error: "You've been banned!"}
    end
  end

  # validate :image_presence
  def image_presence
    errors.add(:post_image, "can't be blank") unless post_image.attached?
  end

  # after_commit :create_hash_tags, on: :create
def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end

def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

end
