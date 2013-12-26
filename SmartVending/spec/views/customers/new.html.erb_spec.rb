require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :name => "MyString",
      :account_balance => "9.99",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_name[name=?]", "customer[name]"
      assert_select "input#customer_account_balance[name=?]", "customer[account_balance]"
      assert_select "input#customer_phone[name=?]", "customer[phone]"
    end
  end
end
