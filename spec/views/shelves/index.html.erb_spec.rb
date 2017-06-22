require 'rails_helper'

RSpec.describe "shelves/index", type: :view do
  before(:each) do
    assign(:shelves, [
      Shelf.create!(
        :title => "Title",
        :user => nil
      ),
      Shelf.create!(
        :title => "Title",
        :user => nil
      )
    ])
  end

  it "renders a list of shelves" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
