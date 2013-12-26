require 'spec_helper'

describe "machines/index" do
  before(:each) do
    assign(:machines, [
      stub_model(Machine,
        :extID => 1,
        :name => "Name",
        :description => "Description",
        :category => "Category",
        :status => "Status"
      ),
      stub_model(Machine,
        :extID => 1,
        :name => "Name",
        :description => "Description",
        :category => "Category",
        :status => "Status"
      )
    ])
  end

  it "renders a list of machines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
