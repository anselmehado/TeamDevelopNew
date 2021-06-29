class Task < ApplicationRecord
    validates :name, presence: true

    # def self.search(deadline)
    #   where("status like ?", "%#{status}%")
    # end

    # def self.search(search)
    # where("status LIKE ?", "%#{search}%")
    # end

    enum status: {
    unstated: 0,
   inprogres: 1,
    complete: 2
  }
end
