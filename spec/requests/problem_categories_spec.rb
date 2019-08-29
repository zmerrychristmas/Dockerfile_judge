require 'rails_helper'

RSpec.describe "ProblemCategories", type: :request do
  describe "GET /problem_categories" do
    it "works! (now write some real specs)" do
      get problem_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
