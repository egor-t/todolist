class Task < ApplicationRecord
  belongs_to :list
  before_create :set_status

  scope :archived, -> { where(status: true)}
  scope :active, -> { where(status: false)}

  private

  def set_status
    self.status = false
  end
end
