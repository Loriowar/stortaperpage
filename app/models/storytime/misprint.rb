module Storytime
  class Misprint < ActiveRecord::Base
    validates :page_url, presence: :true
    # must be present at least one of following fields
    validates :target_text, presence: true, unless: :user_message?
    validates :user_message, presence: true, length: {maximum: 2000}, unless: :target_text?

    def fixed?
      !fixed_at.nil?
    end

    def fixed!
      self.update_attribute(:fixed_at, Time.now)
    end
  end
end
