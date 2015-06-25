module Parsehub
  class Run
    def self.fetch(token)
      Parsehub::Request.new(:get, "runs/#{token}").send
    end

    def self.data(token, params = {})
      Parsehub::Request.new(:get, "runs/#{token}/data", params).send
    end

    def self.cancel(token)
      Parsehub::Request.new(:post, "runs/#{token}/cancel").send
    end

    def self.delete(token)
      Parsehub::Request.new(:delete, "runs/#{token}").send
    end
  end
end
