class Task < ApplicationRecord
    validates :task_name, presence: true

    enum status: {
    unstated: 0,
    inprogres: 1,
    complete: 2
  }

  enum priority: {
    hight: 0,
    medium: 1,
    low: 2
  }

  scope :task_name_fuzzy_search, ->(params) { where('task_name LIKE ?', "%#{params}%") }
  scope :status_search, ->(params) { where(status: params) }

  scope :user_task_list, -> (query) {where(user_id: query)}
def user_task_list(query)
  where(user_id: query)
end

  paginates_per 3

  belongs_to :user
	end
