require 'rails_helper'

RSpec.describe "accounts/new", :type => :view do
  before(:each) do
    assign(:account, Account.new(
      :name => "MyString",
      :access_key => "MyString",
      :secret_access_key => "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_name[name=?]", "account[name]"

      assert_select "input#account_access_key[name=?]", "account[access_key]"

      assert_select "input#account_secret_access_key[name=?]", "account[secret_access_key]"
    end
  end
end
