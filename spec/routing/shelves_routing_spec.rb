require "rails_helper"

RSpec.describe ShelvesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shelves").to route_to("shelves#index")
    end

    it "routes to #new" do
      expect(:get => "/shelves/new").to route_to("shelves#new")
    end

    it "routes to #show" do
      expect(:get => "/shelves/1").to route_to("shelves#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shelves/1/edit").to route_to("shelves#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shelves").to route_to("shelves#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shelves/1").to route_to("shelves#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shelves/1").to route_to("shelves#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shelves/1").to route_to("shelves#destroy", :id => "1")
    end

  end
end
