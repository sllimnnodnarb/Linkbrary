require 'rails_helper'

RSpec.describe "shelves/edit", type: :view do
  before(:each) do
    @shelf = assign(:shelf, Shelf.create!(
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders the edit shelf form" do
    render

    assert_select "form[action=?][method=?]", shelf_path(@shelf), "post" do

      assert_select "input#shelf_title[name=?]", "shelf[title]"

      assert_select "input#shelf_user_id[name=?]", "shelf[user_id]"
    end
  end
end
