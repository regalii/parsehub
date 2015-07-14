module Parsehub
  class Logger < ::Logger

    def format_message(severity, datetime, progname, msg)
      "[%s] %s\n" % [
        datetime.strftime('%m/%d/%Y %H:%M:%S %Z'),
        case msg
        when Parsehub::Request
          "-- PARSEHUB REQUEST --\n #{msg.to_json}"
        when Parsehub::Response
          "-- PARSEHUB RESPONSE --\n #{msg.to_json}"
        else
          msg
        end
      ]
    end
  end
end
