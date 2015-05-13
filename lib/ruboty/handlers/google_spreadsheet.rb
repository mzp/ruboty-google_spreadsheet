module Ruboty
  module Handlers
    class GoogleSpreadsheet < Base
      env :GOOGLE_CLIENT_ID, "Client ID"
      env :GOOGLE_CLIENT_SECRET, "Client secret"
      env :GOOGLE_REDIRECT_URI, "Redirect URI"
      env :GOOGLE_REFRESH_TOKEN, "Refresh token issued with access token"

      on(
        /spreadsheet today (?<key>\S+)/,
        name: "show_spreadsheet",
        description: "Create a new issue",
      )

      def show_spreadsheet(message)
        Ruboty::Actions::GoogleSpreadsheet::ShowToday.new(message).call
      end
    end
  end
end
