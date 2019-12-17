class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article is created successfully"
      redirect_to article_path(@article)
    else
      flash.now[:notice] = "Article is failed to be saved try again!"
      render "new"
    end
  end

  private
    def article_params
      params.require(:article).permit(:name, :description)
    end

end