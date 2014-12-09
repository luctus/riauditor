require 'rails_helper'

RSpec.describe "accounts/edit", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :name => "MyString",
      :access_key_id => "MyString",
      :secret_access_key => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_name[name=?]", "account[name]"

      assert_select "input#account_access_key_id[name=?]", "account[access_key_id]"

      assert_select "input#account_secret_access_key[name=?]", "account[secret_access_key]"
    end
  end
end
