class Task < ApplicationRecord
    validates :name, presence: true

    # def self.search(deadline)
    #   where("status like ?", "%#{status}%")
    # end
    # def self.search_name(search)
    # where("name LIKE ?", "%#{search}%")
    # end
    #
    def self.search(search)
    where("status LIKE ?", "%#{search}%")
    end

    # def self.search_tasks(search_term)
    #   if search_term == ""
    #     return []
    #   else
    #     where("name LIKE ?", "%#{search_term}")
    #   end
    # end


    enum status: {
    unstated: 0,
   inprogres: 1,
    complete: 2
  }
end
