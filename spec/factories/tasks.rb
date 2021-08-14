require 'date'

FactoryBot.define do
  factory :task do
    task_name { 'Title 1' }
    content { 'undefined' }
    deadline  { '2020/12/01' }
    status { 'completed' }
  end

  factory :second_task, class: Task do
    task_name { 'Title 2' }
    content { 'undefined' }
    deadline { '2020/12/02' }
    status { 'unstarted' }
  end
end

# FactoryBot.define do
#
#   factory :task do
#     task_name{ 'Title 1 made by Factory' }
#     content { 'Default content created by Factory 1' }
#   end
#
#   factory :second_task, class: Task do
#     task_name { 'Title 2 made by Factory' }
#     content { 'Default content 2 made by Factory' }
#   end
# end
