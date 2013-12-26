require 'spec_helper'

describe "alarms/show" do
  before(:each) do
    @alarm = assign(:alarm, stub_model(Alarm,
      :extID => 1,
      :status => "Status",
      :severity => "Severity",
      :object => "Object",
      :category => "Category",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Status/)
    rendered.should match(/Severity/)
    rendered.should match(/Object/)
    rendered.should match(/Category/)
    rendered.should match(/Type/)
  end
end
