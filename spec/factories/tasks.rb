FactoryBot.define do
  factory :task do
    task_name { 'Title 1' }
    content { 'undefined1' }
    deadline  { '2020/12/01' }
    status { 'complete' }
  end

  factory :second_task, class: Task do
    task_name { 'Title 2' }
    content { 'undefined2' }
    deadline { '2020/12/02' }
    status { 'unstated' }
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
