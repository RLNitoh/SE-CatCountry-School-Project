class TrendingController < ApplicationController

  def newest
    @posts = Post.order(date: :desc)
    render :newest
  end

  def oldest
    @posts = Post.order(date: :asc)
    render :oldest
  end

  def today
    @posts = Post.where(date: (Date.today))
    render :today
  end
  
  def week
    @posts = Post.where(date: (Date.today - 7.days)..Date.today)
    render :week
  end

end
