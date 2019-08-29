require "rails_helper"

RSpec.describe ProblemDataController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/problem_data").to route_to("problem_data#index")
    end

    it "routes to #show" do
      expect(:get => "/problem_data/1").to route_to("problem_data#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/problem_data").to route_to("problem_data#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/problem_data/1").to route_to("problem_data#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/problem_data/1").to route_to("problem_data#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/problem_data/1").to route_to("problem_data#destroy", :id => "1")
    end
  end
end
