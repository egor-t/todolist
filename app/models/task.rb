class Task < ApplicationRecord
  belongs_to :list
  before_create :set_status

  scope :archived, -> { where(status: true) }
  scope :active, -> { where(status: false) }
  scope :today, -> { where('date = ?', Date.today) }
  # scope :date_sorted_desc, -> { order('date DESC') }

  private

  def set_status
    self.status = false
  end
end
