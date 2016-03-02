class Activity < ActiveRecord::Base
  include ActivityConstants

  belongs_to :category
  
  default_scope { order('created_at DESC') }
  scope :created_after, ->(time) { where("created_at > ?", time) }
  scope :current, -> { where("status in ? or status is null", [ACTIVITY_STATUS[:open], ACTIVITY_STATUS[:pending]]) }
  scope :pending, -> { where("status in ?", ACTIVITY_STATUS[:pending]) }
  scope :not_categorized, -> { where("category_id is null") }
  scope :get_by_priority, ->(type) { where("priority = ?", type)}

  validates :content, :presence => true

  def closed?
    self.status == "close"
  end

  def self.fetch_by_priority_type(type)
    return unless ACTIVITY_PRIORITIES.keys.include?(type)
    # priority matters only in the open/pending items
    Activity.pending.get_by_priority(type)
  end
end
