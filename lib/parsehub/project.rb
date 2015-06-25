module Parsehub
  class Project
    def self.list
      Parsehub::Request.new(:get, 'projects').send
    end

    def self.fetch(token, params = {})
      Parsehub::Request.new(:get, "projects/#{token}").send
    end

    def self.run(token, params = {})
      Parsehub::Request.new(:post, "projects/#{token}/run", params).send
    end

    def self.last_ready_run(token, params = {})
      Parsehub::Request.new(:get, "projects/#{token}/last_ready_run/data", params).send
    end
  end
end
