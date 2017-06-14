class Menu < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true

  validates :sort_index, numericality: true
end
