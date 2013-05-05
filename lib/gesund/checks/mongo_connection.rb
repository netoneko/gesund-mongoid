require "mongo"

module Gesund::Checks
  class MongoConnection
    include Gesund::Check
    def initialize(options={})
      begin
        if ::Mongo::MongoClient.new(options).ping.keys.first == "ok"
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
