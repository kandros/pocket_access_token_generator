defmodule Pocket.Web.Lol do
  use Tesla
  plug Tesla.Middleware.Headers, %{"content-type" => "application/json"}
  plug Tesla.Middleware.JSON

  @requestTokenUrl "https://getpocket.com/v3/oauth/request"
  @authorizeUrl "https://getpocket.com/auth/authorize"
  @accessTokenUrl "https://getpocket.com/v3/oauth/authorize"

  @redirectUrl "http://google.com"

  def get_request_token(consumer_key) do
    data = %{
      consumer_key: consumer_key,
      redirect_uri: @redirectUrl
    }
    res = post(@requestTokenUrl, data)

    String.replace(res.body, "code=", "")
  end


  def authorize(consumer_key) do
    request_token = get_request_token(consumer_key)
    ri = "#{@redirectUrl}?code=#{request_token}"

    "#{@authorizeUrl}?request_token=#{request_token}&redirect_uri=#{ri}"
  end
end