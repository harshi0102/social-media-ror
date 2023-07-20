class PostsController < ApplicationController
    def newsfeed
      @newsfeed_posts = Post.newsfeed_for_user(current_user)
    end
  end