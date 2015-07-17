module Parsehub
  class Logger < ::Logger
    def format_message(severity, timestamp, progname, msg)
      "[Parsehub::Request] #{timestamp.to_formatted_s(:db)} #{severity} --\n#{msg.to_yaml}\n"
    end
  end
end
