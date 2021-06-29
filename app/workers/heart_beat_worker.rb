class HeartBeatWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3, backtrace: true

  def perform(*args)
    Api.new(args).heart_beat
  end
end
