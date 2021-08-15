require 'date'

FactoryBot.define do
  factory :task do
    task_name { 'Title 1' }
    content { 'undefined' }
    deadline  { '2020/12/01' }
    status { 'complete' }
  end

  factory :second_task, class: Task do
    task_name { 'Title 2' }
    content { 'undefined' }
    deadline { '2020/12/02' }
    status { 'unstated' }

  end
end
