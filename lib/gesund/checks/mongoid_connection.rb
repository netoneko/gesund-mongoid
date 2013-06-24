require "mongoid"

module Gesund::Checks
  class MongoidConnection
    include Gesund::Check
    def initialize(options = {})
      begin
        ### Try to load Mongoid configuration only if it's not already loaded
        begin
          ::Mongoid.default_session
        rescue => e
          ::Mongoid.load!(options[:config])
        end

        if ::Mongoid.default_session.command(ping: 1).keys.first == "ok"
          self.pass "Mongo PING = OK"
        else
          self.fail "Mongo PING != OK"
        end
      rescue => e
        self.fail "#{self.class} ERROR: #{e.class}: #{e.message}"
      end
    end
  end
end
