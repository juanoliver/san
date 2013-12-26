require 'spec_helper'

describe "alarms/new" do
  before(:each) do
    assign(:alarm, stub_model(Alarm,
      :extID => 1,
      :status => "MyString",
      :severity => "MyString",
      :object => "MyString",
      :category => "MyString",
      :type => ""
    ).as_new_record)
  end

  it "renders new alarm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", alarms_path, "post" do
      assert_select "input#alarm_extID[name=?]", "alarm[extID]"
      assert_select "input#alarm_status[name=?]", "alarm[status]"
      assert_select "input#alarm_severity[name=?]", "alarm[severity]"
      assert_select "input#alarm_object[name=?]", "alarm[object]"
      assert_select "input#alarm_category[name=?]", "alarm[category]"
      assert_select "input#alarm_type[name=?]", "alarm[type]"
    end
  end
end
