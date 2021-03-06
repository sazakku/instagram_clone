class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.assign_attributes({:profile_id => current_user.profile.id})
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(comment_params['post_id']), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comments_path(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.post, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Like button
  def like
    @comment = Comment.find(params[:id])
    @like_comment = ProfileLinkablesService.call(current_user.profile.id, @comment, :like, :create)
    respond_to do |format|
      if @like_comment.save
        format.html { redirect_to post_path(comment_params['post_id']), notice: "like this comment."}
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # Unlike button
  def unlike
    @comment = Comment.find(params[:id])
    ProfileLinkablesService.call(current_user.profile.id, @comment, :like, :destroy)
    respond_to do |format|
      format.html { redirect_to post_path(comment_params['post_id']), notice: "Unlike this comment" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :post_id, :profile_id)
    end
end
