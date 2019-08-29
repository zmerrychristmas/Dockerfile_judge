class ProblemDataController < ApplicationController
  before_action :set_problem, only: [:show, :update, :destroy, :create]

  # GET /problem_data
  def index
    @problem_data = ProblemDatum.all

    render json: @problem_data
  end

  # GET /problem_data/1
  def show
    render json: @problem_datum
  end

  # POST /problem_data
  def create
    p @problem
    p params
    # @problem_datum = ProblemDatum.new(problem_datum_params)

    # if @problem_datum.save
    #   render json: @problem_datum, status: :created, location: @problem_datum
    # else
    #   render json: @problem_datum.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /problem_data/1
  def update
    if @problem_datum.update(problem_datum_params)
      render json: @problem_datum
    else
      render json: @problem_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problem_data/1
  def destroy
    @problem_datum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_datum
      @problem_datum = ProblemDatum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def problem_datum_params
      params.fetch(:problem_datum, {})
    end

    def set_problem
      @problem = Problem.find(params[:problem_id])
    end
end
