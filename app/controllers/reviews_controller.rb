class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @user_subject = UserSubject.find(params[:user_id])
    @reviews = @user_subject.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @user_subject = UserSubject.find(params[:user_subject_id])
    @review = @user_subject.reviews.build(review_params) 
    @review.user_subject_id = @user_subject.id 
    #@review = Review.new(review_params)

    if @review.save
      render :show, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      render :show, status: :ok, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user_subject_id, :fechaEvaluacion, :nota)
    end
end
