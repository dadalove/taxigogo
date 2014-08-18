Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '741498435910200', '4f2532d85ec94223852b8e30694c6a1b'
end
OmniAuth.config.on_failure = AuthsController.action(:failure)