class StaticPagesController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
  end
end
