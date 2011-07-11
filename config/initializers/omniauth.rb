# For Proxy Config (maybe?) uncomment this and fill in details:
# OAuth::Consumer.proxy = "http://login:pass@proxy.company.com"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "i0KU4jLYYjWzxpTraWviw", "djMu7QStnBK89MkfIg78tIZ4sFhmGOYjdCjDD0Wsc"
  provider :github, "fb50d6cec58cd26ea6cc", "dcedee1a7601c7fb87bc9a1e74e07dc823a7ac46"
end
