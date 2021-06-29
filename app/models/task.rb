class Task < ApplicationRecord
    validates :name, presence: true

    def self.search(deadline)
      where("status like ?", "%#{status}%")
    end
end
