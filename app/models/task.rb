class Task < ApplicationRecord
    validates :name, presence: true

    # def self.search(deadline)
    #   where("status like ?", "%#{status}%")
    # end

    def self.search(search)
    where("status LIKE ?", "%#{search}%")
    end
end
