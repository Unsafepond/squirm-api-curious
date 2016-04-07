class OauthService
  def initialize
    @connection = Faraday.new( :url => "https://api.twitch.tv/kraken/oauth2") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_token(code, state)
    @connection.post("/token", {client_id: ENV["TWITCH_CLIENT_ID"],
                               client_secret: ENV["TWITCH_CLIENT_SECRET"],
                               grant_type: "authorization_code",
                               redirect_uri: "http://127.0.0.1:3000/auth/twitch/callback",
                               code: code,
                               state: state
                               })
  end
end