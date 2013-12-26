require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :name => "MyString",
      :account_balance => "9.99",
      :phone => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do
      assert_select "input#customer_name[name=?]", "customer[name]"
      assert_select "input#customer_account_balance[name=?]", "customer[account_balance]"
      assert_select "input#customer_phone[name=?]", "customer[phone]"
    end
  end
end
