class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:title, :trending, :search, :help]  

  def home
    render :home
  end

  def title
    render :title
  end

  def trending
    render :trending
  end

  # CHANGED HERE
  def users
    render :users
  end

  def search
    render :search
  end

  def editprofile
    render :editprofile
  end

  def help
    render :help
  end

end
