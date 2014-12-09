require 'rails_helper'

RSpec.describe "accounts/index", :type => :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :name => "Name",
        :access_key_id => "Access Key",
        :secret_access_key => "Secret Access Key"
      ),
      Account.create!(
        :name => "Name",
        :access_key_id => "Access Key",
        :secret_access_key => "Secret Access Key"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Access Key".to_s, :count => 2
    assert_select "tr>td", :text => "Secret Access Key".to_s, :count => 2
  end
end
