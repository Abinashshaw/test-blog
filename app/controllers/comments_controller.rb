class CommentsController < ApplicationController
  before_action :set_article, except: [:new]
  http_basic_authenticate_with name: "admin", password: "krsna", only: :destroy

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save 
      flash[:success] = "Comment is added successfully"
      redirect_to article_path(@article)
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:danger] = "Your comment is successfully destroyed"
    redirect_to article_path(@article)
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end