require "rails_helper"
require "limiter"

def check(limiter, num_requests)
  (1..num_requests).all? {limiter.can_i?(symbol)}
end

RSpec.describe Limiter do
  context "created and limited for a symbol" do
    let(:limiter) {Limiter.new}
    let(:start_time) {Time.now}
    let(:period) {5000}
    let(:max_requests) {100}
    let(:symbol) {:test}

    before do
      limiter.limit(symbol, period, max_requests, start_time)
    end

    it "allows < num requests per time period" do
      expect(check(limiter, max_requests - 1)).to eql(true)
    end

    it "denies > num requests per time period" do
      expect(check(limiter, max_requests + 10)).to eql(false)
    end

    it "reallows after time passed" do
      expect(check(limiter, max_requests + 10)).to eql(false)
      expect(limiter.can_i?(symbol, start_time + (period + 1) / 1000))
    end

  end
end
