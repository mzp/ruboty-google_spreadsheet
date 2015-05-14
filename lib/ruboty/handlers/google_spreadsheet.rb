module Ruboty
  module Handlers
    class GoogleSpreadsheet < Base
      env :GOOGLE_CLIENT_ID, "Client ID"
      env :GOOGLE_CLIENT_SECRET, "Client secret"
      env :GOOGLE_REDIRECT_URI, "Redirect URI"
      env :GOOGLE_REFRESH_TOKEN, "Refresh token issued with access token"

      on(
        /spreadsheet today (?<key>\S+)/,
        name: "show_today",
        description: "Show today row"
      )

      on(
        /spreadsheet tommorow (?<key>\S+)/,
        name: "show_tommorow",
        description: "Show tommorow row"
      )

      def show_today(message)
        Ruboty::Actions::GoogleSpreadsheet::ShowToday.new(message, :today).call
      end

      def show_tommorow(message)
        Ruboty::Actions::GoogleSpreadsheet::ShowToday.new(message, :tommorow).call
      end
    end
  end
end
