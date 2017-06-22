require 'rails_helper'

RSpec.describe "shelves/show", type: :view do
  before(:each) do
    @shelf = assign(:shelf, Shelf.create!(
      :title => "Title",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
