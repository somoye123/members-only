class PostsController < ApplicationController
  # before_action :authenticate_member!, only: %i[new create]

    def index
      @posts = Post.all
    end
    def new
        @post = Post.new
        # @post = current_user.post.build
    end
    def create
        @post = current_user.post.build(posts_params)
        if @post.save
            flash[:notice] = 'Post was created successfully'
            redirect_to posts_path
        else
            flash[:alert] = 'Woops something went wrong'
            render 'new'
        end
    end
    
    private

  def posts_params
    params.require(:post).permit(:title, :body)
  end
end
