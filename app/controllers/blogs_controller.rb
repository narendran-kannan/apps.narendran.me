class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by(slug: params[:slug])
    if @blog
      render 'show'
    else
      render 'blog_not_found'
    end
  end
end
