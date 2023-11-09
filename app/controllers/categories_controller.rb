class CategoriesController < ApplicationController
    # before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
      @categories = Category.all
    end
  
    # def show
    #   # Display category details and associated articles
    #   @articles = @category.articles
    # end
   
    private
  
#     def set_category
#       @category = Category.find(params[:id])
#     end
end
  
