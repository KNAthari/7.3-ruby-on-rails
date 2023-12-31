# frozen_string_literal: true

class CommentsController < ApplicationController


    def index
      @comments = Comment.where(article_id: params[:article_id])
      render json: @comments
    end

    # def show
    #   @category = Category.find(params[:category_id])
    #   @article = Article.find(params[:article_id])
  
    #   @comment = @article.comments(comments_params)
    # end

    def create
      @category = Category.find(params[:category_id])
      @article = Article.find(params[:article_id])
  
      @comment = @article.comments.create(comment_params)
  
      redirect_to category_article_path(@category, @article)
    end
  
    def destroy
      @category = Category.find(params[:category_id])
      @article = Article.find(params[:article_id])
  
      @comment = @article.comments.find(params[:id])
      
      @comment.destroy
      redirect_to category_article_path(@category, @article), status: :see_other
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
  end