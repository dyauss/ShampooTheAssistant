require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'launchy'

class CalendarQuickstart
  APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'.freeze
  CREDENTIALS_PATH = './credentials_file.json'.freeze
  TOKEN_PATH = 'token.yaml'.freeze
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY
  
  def self.get_credentials
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)

    credentials = authorizer.get_credentials('user_id')
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: 'urn:ietf:wg:oauth:2.0:oob')
      puts 'Open the following URL in the browser and enter the ' \
        "resulting code after authorization:\n#{url}"
      code = gets.chomp
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: 'user_id', code: code, base_url: 'urn:ietf:wg:oauth:2.0:oob'
      )
    end
    credentials
  end

  def self.send_url_authorizer
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)

    credentials = authorizer.get_credentials('user_id')
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: 'urn:ietf:wg:oauth:2.0:oob')
      puts 'Open the following URL in the browser and enter the ' \
        "resulting code after authorization:\n#{url}"
      # Launchy.open(url)
      # code = gets.chomp
      # credentials = authorizer.get_and_store_credentials_from_code(
      #   user_id: 'user_id', code: code, base_url: 'urn:ietf:wg:oauth:2.0:oob'
      # )
      url
    else
      string = 'Seus credentials já estão armazenados'
    end
  end

  def self.set_code(code)
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)

    credentials = authorizer.get_credentials('user_id')

    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: 'user_id', code: code, base_url: 'urn:ietf:wg:oauth:2.0:oob'
    )
  end
end
  