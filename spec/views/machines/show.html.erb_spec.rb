require 'spec_helper'

describe "machines/show" do
  before(:each) do
    @machine = assign(:machine, stub_model(Machine,
      :extID => 1,
      :name => "Name",
      :description => "Description",
      :category => "Category",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Category/)
    rendered.should match(/Status/)
  end
end
