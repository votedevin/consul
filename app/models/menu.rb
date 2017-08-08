class Menu < ActiveRecord::Base
  TYPES = %w(header top_right_header main_menu_first)

  validates :title, presence: true
  validates :url, presence: true
  validates :menu_type, presence: true

  validates :sort_index, numericality: true

  scope :by_type, ->(type) { where(menu_type: type) }
end
