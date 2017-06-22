require 'rails_helper'

RSpec.describe "shelves/new", type: :view do
  before(:each) do
    assign(:shelf, Shelf.new(
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders new shelf form" do
    render

    assert_select "form[action=?][method=?]", shelves_path, "post" do

      assert_select "input#shelf_title[name=?]", "shelf[title]"

      assert_select "input#shelf_user_id[name=?]", "shelf[user_id]"
    end
  end
end
