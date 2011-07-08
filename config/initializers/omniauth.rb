# For Proxy Config (maybe?) uncomment this and fill in details:
# OAuth::Consumer.proxy = "http://login:pass@proxy.company.com"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "i0KU4jLYYjWzxpTraWviw", "djMu7QStnBK89MkfIg78tIZ4sFhmGOYjdCjDD0Wsc"
  provider :github, "something", "else"
end
