# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するundefinedデータの名前を「task」とします
  # （実際に存在するクラス名と一致するundefinedデータの名前をつければ、そのクラスのundefinedデータを自動で作成します）
  factory :task do
    name { 'Title 1 made by Factory' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
  end
  # 作成するundefinedデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのundefinedデータにしてください」と指定します）
  factory :second_task, class: Task do
    name { 'Title 2 made by Factory' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
  end
end
