require 'test_helper'

describe Parsehub::Run do
  before do
    Parsehub.configure do |config|
      config.api_key = 'test-api-key'
    end
  end

  it "fetches run" do
    VCR.use_cassette('fetch_run') do
      Parsehub::Run.fetch('test-run-token')
    end

    assert_requested :get,
      "https://www.parsehub.com/api/v2/runs/test-run-token?api_key=test-api-key",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub Ruby gem v2.0.0'
      }
  end

  it "fetches run data" do
    VCR.use_cassette('fetch_run_data') do
      Parsehub::Run.data('test-run-token')
    end

    assert_requested :get,
      "https://www.parsehub.com/api/v2/runs/test-run-token/data?api_key=test-api-key",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub Ruby gem v2.0.0'
      }
  end

  it "cancels a run" do
    VCR.use_cassette('cancel_run') do
      Parsehub::Run.cancel('test-run-token')
    end

    assert_requested :post,
      "https://www.parsehub.com/api/v2/runs/test-run-token/cancel?api_key=test-api-key",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub Ruby gem v2.0.0'
      }
  end

  it "delete a run" do
    VCR.use_cassette('delete_run') do
      Parsehub::Run.delete('test-run-token')
    end

    assert_requested :delete,
      "https://www.parsehub.com/api/v2/runs/test-run-token?api_key=test-api-key",
      headers: {
        'Accept'          => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'      => 'Parsehub Ruby gem v2.0.0'
      }
  end
end
