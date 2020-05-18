class Play < ApplicationRecord
  validates :counter, :url, presence: true
end
