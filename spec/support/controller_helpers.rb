module ControllerHelpers
  def json_body
    JSON.parse subject.body
  rescue StandardError
    nil
  end

  def login_user(user)
    request.headers['Authorization'] = "Bearer #{user.auth_token}"
  end
end
