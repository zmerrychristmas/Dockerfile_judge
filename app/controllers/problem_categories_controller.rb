class ProblemCategoriesController < ApplicationController
  before_action :set_problem_category, only: [:show, :update, :destroy]

  # GET /problem_categories
  def index
    @problem_categories = ProblemCategory.all

    render json: @problem_categories
  end

  # GET /problem_categories/1
  def show
    render json: @problem_category
  end

  # POST /problem_categories
  def create
    @problem_category = ProblemCategory.new(problem_category_params)

    if @problem_category.save
      render json: @problem_category, status: :created, location: @problem_category
    else
      render json: @problem_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /problem_categories/1
  def update
    if @problem_category.update(problem_category_params)
      render json: @problem_category
    else
      render json: @problem_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problem_categories/1
  def destroy
    @problem_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_category
      @problem_category = ProblemCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def problem_category_params
      params.require(:problem_category).permit(:title, :description)
    end
end
