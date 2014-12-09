json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :access_key_id, :secret_access_key
  json.url account_url(account, format: :json)
end
