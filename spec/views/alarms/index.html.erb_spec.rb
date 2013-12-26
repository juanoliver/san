require 'spec_helper'

describe "alarms/index" do
  before(:each) do
    assign(:alarms, [
      stub_model(Alarm,
        :extID => 1,
        :status => "Status",
        :severity => "Severity",
        :object => "Object",
        :category => "Category",
        :tipe => "Type"
      ),
      stub_model(Alarm,
        :extID => 1,
        :status => "Status",
        :severity => "Severity",
        :object => "Object",
        :category => "Category",
        :tipe => "Type"
      )
    ])
  end

  it "renders a list of alarms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Severity".to_s, :count => 2
    assert_select "tr>td", :text => "Object".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
