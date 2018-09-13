class Task < ApplicationRecord
  belongs_to :list
  before_create :set_status

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: false, length: { maximum: 50 }

  scope :archived, -> { where(status: true) }
  scope :active, -> { where(status: false).order('date ASC') }
  scope :today, -> { where('date = ?', Date.today) }
  # scope :date_sorted_desc, -> { order('date DESC') }

  private

  def set_status
    self.status = false
  end
end
