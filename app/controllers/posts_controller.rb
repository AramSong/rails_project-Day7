class PostsController < ApplicationController
    before_action :set_post, only:[:show,:edit,:update,:destroy]
    
    def index 
        @Posts = Post.all
    end
    
    def new 

    end
    
    def create
        post = Post.create(post_params)
        
        redirect_to "/posts/#{post.id}"
    end
    
    def show
#        @post = Post.find(params[:id])

    end
    
    def edit
    end
    
    def update
        @post.update(post_params)
        
        redirect_to "/posts/#{@post.id}"
    end
    
    def destroy
        @post.destroy
        
        redirect_to "/posts"
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
    
    def post_params
        {title: params[:title],contents: params[:contents]}
    end
    
end
