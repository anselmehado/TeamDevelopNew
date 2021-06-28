class Task < ApplicationRecord
    validates :name, presence: true

    def self.search(deadline)
      where("deadline like ?", "%#{deadline}%")
    end
end
