require 'spec_helper'

describe "machines/edit" do
  before(:each) do
    @machine = assign(:machine, stub_model(Machine,
      :extID => 1,
      :name => "MyString",
      :description => "MyString",
      :category => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit machine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", machine_path(@machine), "post" do
      assert_select "input#machine_extID[name=?]", "machine[extID]"
      assert_select "input#machine_name[name=?]", "machine[name]"
      assert_select "input#machine_description[name=?]", "machine[description]"
      assert_select "input#machine_category[name=?]", "machine[category]"
      assert_select "input#machine_status[name=?]", "machine[status]"
    end
  end
end
