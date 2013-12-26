require 'spec_helper'

describe "alarms/edit" do
  before(:each) do
    @alarm = assign(:alarm, stub_model(Alarm,
      :extID => 1,
      :status => "MyString",
      :severity => "MyString",
      :object => "MyString",
      :category => "MyString",
      :tipe => ""
    ))
  end

  it "renders the edit alarm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", alarm_path(@alarm), "post" do
      assert_select "input#alarm_extID[name=?]", "alarm[extID]"
      assert_select "input#alarm_status[name=?]", "alarm[status]"
      assert_select "input#alarm_severity[name=?]", "alarm[severity]"
      assert_select "input#alarm_object[name=?]", "alarm[object]"
      assert_select "input#alarm_category[name=?]", "alarm[category]"
      assert_select "input#alarm_tipe[name=?]", "alarm[tipe]"
    end
  end
end
