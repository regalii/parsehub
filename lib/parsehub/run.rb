module Parsehub
  class Run
    def self.fetch(token)
      Parsehub::Request.new("runs/#{token}").get
    end

    def self.data(token, params = {})
      Parsehub::Request.new("runs/#{token}/data", params).get
    end

    def self.cancel(token)
      Parsehub::Request.new("runs/#{token}/cancel").post
    end

    def self.delete(token)
      Parsehub::Request.new("runs/#{token}").delete
    end
  end
end
