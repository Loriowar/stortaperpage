class StorytimePostNotificationJob < ActiveJob::Base
  queue_as :mailers

  def perform(post_id)
    Storytime::PostNotifier.send_notifications_for(post_id)
  end
end