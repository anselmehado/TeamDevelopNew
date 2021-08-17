require 'rails_helper'
describe 'Task management function', type: :system do
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        # undefinedで使用するためのタスクを作成
        task = FactoryBot.create(:task, title: 'task')
        # Transition to task list page
        visit tasks_path
        # The text "task" appears on the visited (transitioned) page (task list page)
        # expect (confirm/expect) that have_content is included (is included)
        expect(page).to have_content 'task'
        # expectの結果が true ならundefined成功、false なら失敗として結果が出力される
      end
    end
  end
end
