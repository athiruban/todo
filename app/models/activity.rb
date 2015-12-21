class Activity < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  scope :created_after, ->(time) { where("created_at > ?", time) }
  scope :pending, -> { where("status = ? or status is null", "open") }

  validates :content, :presence => true

  def closed?
    self.status == "close"
  end
end
