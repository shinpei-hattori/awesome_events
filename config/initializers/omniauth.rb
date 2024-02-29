Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "75c9e88026c45f68e974", "86e50eb8ac5c80db6448ad5af89ecd9e9b516685"
  else
    provider :github,
      Rails.application.credentials.github[:client_id],
      Rails.application.credentials.github[:client_secret]
  end
end
