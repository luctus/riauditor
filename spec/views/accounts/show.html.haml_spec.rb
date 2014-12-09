require 'rails_helper'

RSpec.describe "accounts/show", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :name => "Name",
      :access_key_id => "Access Key",
      :secret_access_key => "Secret Access Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Access Key/)
    expect(rendered).to match(/Secret Access Key/)
  end
end
