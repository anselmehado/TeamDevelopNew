class Task < ApplicationRecord
    validates :name, presence: true


    # def self.search(search)
    # where("status LIKE ?", "%#{search}%")
    # end


    def self.search(search)
      where("name LIKE ?", "%#{search}%")
    end

    def self.search_status(search)
      where("status LIKE ?", "%#{search}%")
    end


    enum status: {
    unstated: 0,
   inprogres: 1,
    complete: 2
  }
end
