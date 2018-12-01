class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @wine = Wine.find(params[:wine_id])
    @comment = @wine.comments.create(params[:comment].permit(:name, :comment))
    redirect_to wine_path(@wine)
  end

  def edit
    @comment = Comment.find_by(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to @comment
    else
      render :edits
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :wine_id)
    end
end
