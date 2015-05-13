require 'date'

module Ruboty
    module Actions
      module GoogleSpreadsheet
        class ShowToday
          attr_reader :message, :client

          def initialize(message)
            @message = message

            @client = Ruboty::GoogleSpreadsheet::Client.new(
              client_id: ENV["GOOGLE_CLIENT_ID"],
              client_secret: ENV["GOOGLE_CLIENT_SECRET"],
              redirect_uri: ENV["GOOGLE_REDIRECT_URI"],
              refresh_token: ENV["GOOGLE_REFRESH_TOKEN"]
            )
            @client.authorize!
          end

          def call
            message.reply row.join(' ')
          end

          private

          def data
            @data ||= Ruboty::GoogleSpreadsheet::Spreadsheet.new(
              access_token: @client.access_token,
              spreadsheet_key: key
            )
          end

          def key
            message[:key]
          end

          def today
            Date.today.strftime("%Y/%m/%d")
          end

          def row
            data[0].rows.find {|row| row.include? today }
          end
        end
      end
    end
end
