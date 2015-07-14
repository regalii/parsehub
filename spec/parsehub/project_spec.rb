require 'test_helper'

describe Parsehub::Project do
  before do
    Parsehub.configure do |config|
      config.api_key = 'test-api-key'
      config.logger  = false
    end
  end

  it "lists projects" do
    VCR.use_cassette('list_projects') do
      Parsehub::Project.list
    end

    assert_requested :get,
      "https://www.parsehub.com/api/v2/projects?api_key=test-api-key",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub ruby gem v2.0.0'
      }
  end

  it "gets project" do
    VCR.use_cassette('fetch_project') do
      Parsehub::Project.fetch('test-project-token')
    end

    assert_requested :get,
      "https://www.parsehub.com/api/v2/projects/test-project-token?api_key=test-api-key",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub ruby gem v2.0.0'
      }
  end

  it "runs project" do
    VCR.use_cassette('run_project') do
      Parsehub::Project.run('test-project-token')
    end

    assert_requested :post,
      "https://www.parsehub.com/api/v2/projects/test-project-token/run",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub ruby gem v2.0.0'
      }
  end

  it "returns last ready run's data" do
    VCR.use_cassette('last_ready_run') do
      Parsehub::Project.last_ready_run('test-project-token')
    end

    assert_requested :get,
      "https://www.parsehub.com/api/v2/projects/test-project-token/last_ready_run/data?api_key=test-api-key",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub ruby gem v2.0.0'
      }
  end
end
