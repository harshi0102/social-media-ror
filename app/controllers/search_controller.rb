class SearchController < ApplicationController
  def users
    @users = User.where('name ILIKE ?', "%#{params[:q]}%")
  end

  def posts
    @posts = Post.where('content ILIKE ?', "%#{params[:q]}%")
  end
end
