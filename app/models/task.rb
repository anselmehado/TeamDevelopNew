class Task < ApplicationRecord
    validates :name, presence: true
    scope :name_fuzzy_search, ->(params) { where('name LIKE ?', "%#{params}%") }
    scope :status_search, ->(params) { where(status: params) }



    enum status: {
    unstated: 0,
    inprogres: 1,
    complete: 2
  }

	end
