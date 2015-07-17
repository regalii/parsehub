module Parsehub
  class Project
    def self.list
      Parsehub::Request.new('projects').get
    end

    def self.fetch(token, params = {})
      Parsehub::Request.new("projects/#{token}").get
    end

    def self.run(token, params = {})
      Parsehub::Request.new("projects/#{token}/run", params).post
    end

    def self.last_ready_run(token, params = {})
      Parsehub::Request.new("projects/#{token}/last_ready_run/data", params).get
    end
  end
end
