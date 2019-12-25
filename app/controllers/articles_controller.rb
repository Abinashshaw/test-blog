class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: "krsna", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article is created successfully"
      redirect_to article_path(@article)
    else
      # flash.now[:notice] = "Article is failed to be saved try again!"
      render "new"
    end
  end

  def edit
    
  end

  def update 
    if @article.update(article_params)
      flash[:success] = "Article is successfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article is successfully destroyed"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end