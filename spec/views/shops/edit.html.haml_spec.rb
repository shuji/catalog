require 'spec_helper'

describe "shops/edit" do
  before(:each) do
    @shop = assign(:shop, stub_model(Shop,
      :name => "MyString",
      :description => "MyText",
      :lines_summary => "MyText"
    ))
  end

  it "renders the edit shop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shops_path(@shop), :method => "post" do
      assert_select "input#shop_name", :name => "shop[name]"
      assert_select "textarea#shop_description", :name => "shop[description]"
      assert_select "textarea#shop_lines_summary", :name => "shop[lines_summary]"
    end
  end
end
