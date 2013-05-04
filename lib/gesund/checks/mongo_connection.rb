require "mongo"

module Gesund::Checks
  class MongoConnection
    include Gesund::Check
    include ::Mongo
    def initialize(options)
      begin
        self.success = (MongoClient.new.ping.keys.first == "ok")
        self.message = "Mongo PING = OK"
      rescue => e
        self.message = "#{e.class}: #{e.message}"
        self.success = false
      end
    end
  end
end
