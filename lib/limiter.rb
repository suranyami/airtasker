class Limiter
  attr_accessor :buckets
  def initialize
    @buckets = {}
  end

  def limit(symbol, period = 5000, max_requests = 100, last_reset: Time.now)
    @buckets[symbol] = {
      period: period / 1000,
      max: max_requests,
      last_reset: last,
      reset_time: last_reset + period / 1000,
      tokens: max_requests
    }
  end

  def can_i?(symbol, now = Time.now)
    reset_if_need(symbol, now)
    bucket = @buckets[symbol]
    if bucket[:tokens] > 0
      bucket[:tokens] -= 1
      true
    else
      false
    end
  end

  def reset(symbol, now = Time.now)
    bucket = @buckets[symbol]
    bucket[:last_reset] = now
    bucket[:reset_time] = now + bucket[:period]
    bucket[:tokens] = bucket[:max]
  end

  def reset_if_need(symbol, now = Time.now)
    bucket = @buckets[symbol]
    reset(symbol, now) if now >= bucket[:reset_time]
  end
end
