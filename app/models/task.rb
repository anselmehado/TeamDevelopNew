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

    scope :label_task_search, -> (query) {
		@ids = Labelling.where(label_id: query).pluck(:task_id)
		where(id: @ids)}


    has_many :labellings, dependent: :destroy
    has_many :labels, through: :labellings

  paginates_per 3

  belongs_to :user
	end










    #   scope :label_serch, -> (label_id) {
    #   where(label_id: label_id)
    # }
    #
    # def has_label?(label)
    #   # results = self.labels.select do |l|
    #   #   l.id == label
    #   # end
    #   results = self.labels.select { |l| l.id == label.id }
    #   results.length > 0
    # end
