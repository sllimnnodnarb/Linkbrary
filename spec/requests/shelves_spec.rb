require 'rails_helper'

RSpec.describe "Shelves", type: :request do
  describe "GET /shelves" do
    it "works! (now write some real specs)" do
      get shelves_path
      expect(response).to have_http_status(200)
    end
  end
end
